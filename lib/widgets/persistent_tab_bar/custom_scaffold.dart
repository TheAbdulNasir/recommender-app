import 'package:flutter/material.dart';
import 'package:sharing_app/widgets/persistent_tab_bar/custom_tab_bar.dart';

class CustomTabController extends ChangeNotifier {
  CustomTabController({int initialIndex = 0})
      : _index = initialIndex,
        assert(initialIndex != null),
        assert(initialIndex >= 0);

  bool _isDisposed = false;

  int _index;
  int get index => _index;
  set index(int value) {
    assert(value != null);
    assert(value >= 0);
    if (_index == value) {
      return;
    }
    _index = value;
    notifyListeners();
  }

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }
}

class CustomTabScaffold extends StatefulWidget {
  CustomTabScaffold({
    Key key,
    @required this.tabBar,
    @required this.tabBuilder,
    this.controller,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
  })  : assert(tabBar != null),
        assert(tabBuilder != null),
        assert(
            controller == null || controller.index < tabBar.items.length,
            "The CustomTabController's current index ${controller.index} is "
            'out of bounds for the tab bar with ${tabBar.items.length} tabs'),
        super(key: key);

  final CustomTabBar tabBar;
  final CustomTabController controller;
  final IndexedWidgetBuilder tabBuilder;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;

  @override
  _CustomTabScaffoldState createState() => _CustomTabScaffoldState();
}

class _CustomTabScaffoldState extends State<CustomTabScaffold> {
  CustomTabController _controller;

  @override
  void initState() {
    super.initState();
    _updateTabController();
  }

  void _updateTabController({bool shouldDisposeOldController = false}) {
    final CustomTabController newController =
        // User provided a new controller, update `_controller` with it.
        widget.controller ??
            CustomTabController(initialIndex: widget.tabBar.currentIndex);

    if (newController == _controller) {
      return;
    }

    if (shouldDisposeOldController) {
      _controller?.dispose();
    } else if (_controller?._isDisposed == false) {
      _controller.removeListener(_onCurrentIndexChange);
    }

    newController.addListener(_onCurrentIndexChange);
    _controller = newController;
  }

  void _onCurrentIndexChange() {
    assert(
        _controller.index >= 0 &&
            _controller.index < widget.tabBar.items.length,
        "The $runtimeType's current index ${_controller.index} is "
        'out of bounds for the tab bar with ${widget.tabBar.items.length} tabs');

    // The value of `_controller.index` has already been updated at this point.
    // Calling `setState` to rebuild using `_controller.index`.
    setState(() {});
  }

  @override
  void didUpdateWidget(CustomTabScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController(
          shouldDisposeOldController: oldWidget.controller == null);
    } else if (_controller.index >= widget.tabBar.items.length) {
      // If a new [tabBar] with less than (_controller.index + 1) items is provided,
      // clamp the current index.
      _controller.index = widget.tabBar.items.length - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData existingMediaQuery = MediaQuery.of(context);
    MediaQueryData newMediaQuery = MediaQuery.of(context);

    Widget content = _TabSwitchingView(
      currentTabIndex: _controller.index,
      tabCount: widget.tabBar.items.length,
      tabBuilder: widget.tabBuilder,
    );
    EdgeInsets contentPadding = EdgeInsets.zero;

    if (widget.resizeToAvoidBottomInset) {
      // Remove the view inset and add it back as a padding in the inner content.
      newMediaQuery = newMediaQuery.removeViewInsets(removeBottom: true);
      contentPadding =
          EdgeInsets.only(bottom: existingMediaQuery.viewInsets.bottom);
    }

    if (widget.tabBar != null &&
        // Only pad the content with the height of the tab bar if the tab
        // isn't already entirely obstructed by a keyboard or other view insets.
        // Don't double pad.
        (!widget.resizeToAvoidBottomInset ||
            widget.tabBar.preferredSize.height >
                existingMediaQuery.viewInsets.bottom)) {
      final double bottomPadding = widget.tabBar.preferredSize.height +
          existingMediaQuery.padding.bottom;

      contentPadding = EdgeInsets.only(bottom: bottomPadding);
      newMediaQuery = newMediaQuery.removePadding(removeBottom: true);
    }

    content = MediaQuery(
      data: newMediaQuery,
      child: Padding(
        padding: contentPadding,
        child: content,
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Stack(
        children: <Widget>[
          // The main content being at the bottom is added to the stack first.
          content,
          MediaQuery(
            data: existingMediaQuery.copyWith(textScaleFactor: 1),
            child: Align(
              alignment: Alignment.bottomCenter,
              // Override the tab bar's currentIndex to the current tab and hook in
              // our own listener to update the [_controller.currentIndex] on top of a possibly user
              // provided callback.
              child: widget.tabBar.copyWith(
                currentIndex: _controller.index,
                onTap: (int newIndex) {
                  _controller.index = newIndex;
                  // Chain the user's original callback.
                  if (widget.tabBar.onTap != null) {
                    widget.tabBar.onTap(newIndex);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Only dispose `_controller` when the state instance owns it.
    if (widget.controller == null) {
      _controller?.dispose();
    } else if (_controller?._isDisposed == false) {
      _controller.removeListener(_onCurrentIndexChange);
    }

    super.dispose();
  }
}

/// A widget laying out multiple tabs with only one active tab being built
/// at a time and on stage. Off stage tabs' animations are stopped.
class _TabSwitchingView extends StatefulWidget {
  const _TabSwitchingView({
    @required this.currentTabIndex,
    @required this.tabCount,
    @required this.tabBuilder,
  })  : assert(currentTabIndex != null),
        assert(tabCount != null && tabCount > 0),
        assert(tabBuilder != null);

  final int currentTabIndex;
  final int tabCount;
  final IndexedWidgetBuilder tabBuilder;

  @override
  _TabSwitchingViewState createState() => _TabSwitchingViewState();
}

class _TabSwitchingViewState extends State<_TabSwitchingView> {
  final List<bool> shouldBuildTab = <bool>[];
  final List<FocusScopeNode> tabFocusNodes = <FocusScopeNode>[];

  // When focus nodes are no longer needed, we need to dispose of them, but we
  // can't be sure that nothing else is listening to them until this widget is
  // disposed of, so when they are no longer needed, we move them to this list,
  // and dispose of them when we dispose of this widget.
  final List<FocusScopeNode> discardedNodes = <FocusScopeNode>[];

  @override
  void initState() {
    super.initState();
    shouldBuildTab.addAll(List<bool>.filled(widget.tabCount, false));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _focusActiveTab();
  }

  @override
  void didUpdateWidget(_TabSwitchingView oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Only partially invalidate the tabs cache to avoid breaking the current
    // behavior. We assume that the only possible change is either:
    // - new tabs are appended to the tab list, or
    // - some trailing tabs are removed.
    // If the above assumption is not true, some tabs may lose their state.
    final int lengthDiff = widget.tabCount - shouldBuildTab.length;
    if (lengthDiff > 0) {
      shouldBuildTab.addAll(List<bool>.filled(lengthDiff, false));
    } else if (lengthDiff < 0) {
      shouldBuildTab.removeRange(widget.tabCount, shouldBuildTab.length);
    }
    _focusActiveTab();
  }

  // Will focus the active tab if the FocusScope above it has focus already.  If
  // not, then it will just mark it as the preferred focus for that scope.
  void _focusActiveTab() {
    if (tabFocusNodes.length != widget.tabCount) {
      if (tabFocusNodes.length > widget.tabCount) {
        discardedNodes.addAll(tabFocusNodes.sublist(widget.tabCount));
        tabFocusNodes.removeRange(widget.tabCount, tabFocusNodes.length);
      } else {
        tabFocusNodes.addAll(
          List<FocusScopeNode>.generate(
            widget.tabCount - tabFocusNodes.length,
            (int index) => FocusScopeNode(
                debugLabel:
                    '$CustomTabScaffold Tab ${index + tabFocusNodes.length}'),
          ),
        );
      }
    }
    FocusScope.of(context).setFirstFocus(tabFocusNodes[widget.currentTabIndex]);
  }

  @override
  void dispose() {
    for (final FocusScopeNode focusScopeNode in tabFocusNodes) {
      focusScopeNode.dispose();
    }
    for (final FocusScopeNode focusScopeNode in discardedNodes) {
      focusScopeNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: List<Widget>.generate(widget.tabCount, (int index) {
        final bool active = index == widget.currentTabIndex;
        shouldBuildTab[index] = active || shouldBuildTab[index];

        return Offstage(
          offstage: !active,
          child: TickerMode(
            enabled: active,
            child: FocusScope(
              node: tabFocusNodes[index],
              child: Builder(builder: (BuildContext context) {
                return shouldBuildTab[index]
                    ? widget.tabBuilder(context, index)
                    : Container();
              }),
            ),
          ),
        );
      }),
    );
  }
}
