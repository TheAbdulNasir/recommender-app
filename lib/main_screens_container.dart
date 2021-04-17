import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/spaces/spaces.dart';
import 'package:sharing_app/main_screens/home/home_screen.dart';
import 'package:sharing_app/main_screens/profile/profile_screen.dart';
import 'package:sharing_app/main_screens/search/search_screen.dart';
import 'package:sharing_app/widgets/persistent_tab_bar/custom_scaffold.dart';
import 'package:sharing_app/widgets/persistent_tab_bar/custom_tab_bar.dart';
import 'package:sharing_app/widgets/persistent_tab_bar/custom_view.dart';

class MainScreensContainer extends StatefulWidget {
  final int initialPage;

  const MainScreensContainer({Key key, this.initialPage = 0}) : super(key: key);

  @override
  _MainScreensContainerState createState() => _MainScreensContainerState();
}

class _MainScreensContainerState extends State<MainScreensContainer> {
  CustomTabController _controller;
  // Gives us control over the flat navigators
  List<BuildContext> _contextList;
  final _children = <Widget>[];
  final _historyStack = <int>[];

  @override
  void initState() {
    super.initState();
    _controller = CustomTabController(initialIndex: widget.initialPage);
    _children.addAll([
      HomeScreen(),
      SearchScreen(onBack: _onBack),
      Spaces(onBack: _onBack),
      ProfileScreen(onBack: _onBack),
    ]);

    _contextList = List<BuildContext>(_children.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onBack() {
    // Remove the current screen
    if (_historyStack.isNotEmpty && _historyStack.last == _controller.index) {
      _historyStack.removeLast();
    }
    // Check where to navigate next
    _controller.index =
        _historyStack.isNotEmpty ? _historyStack.removeLast() : 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(_contextList[_controller.index])) {
          // If we're in one of the tab's children, we pop the child
          Navigator.pop(_contextList[_controller.index]);
          return false;
        }
        // Remove the current screen
        if (_historyStack.isNotEmpty &&
            _historyStack.last == _controller.index) {
          _historyStack.removeLast();
        }
        // Check where to navigate next
        if (_historyStack.isNotEmpty) {
          // Go to the previously visited screen
          _controller.index = _historyStack.removeLast();
          return false;
        } else if (_controller.index != 0) {
          // If we're not on the home screen, we navigate back home
          _controller.index = 0;
          return false;
        }
        // Otherwise we quit the app
        return true;
      },
      child: CustomTabScaffold(
        controller: _controller,
        tabBar: CustomTabBar(
          onTap: (val) {
            if (val == 0 && _historyStack.isEmpty) {
              // We are defaulting to home screen by default, we don't want to
              // add it to the history stack when it's empty
              return;
            }
            if (_historyStack.isEmpty || _historyStack.last != val) {
              // Only add to the history if it's not the same as the last element
              _historyStack.add(val);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
            ),
          ],
        ),
        tabBuilder: (context, i) => CustomTabView(
          builder: (context) {
            _contextList[i] = context;
            return _children[i];
          },
        ),
      ),
    );
  }
}
