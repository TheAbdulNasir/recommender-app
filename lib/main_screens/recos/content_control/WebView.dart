import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sharing_app/main_screens/recos/reco-landing/single_reco_screen.dart';

import '../EngagementButtons.dart';

class RecoWebViewDialog extends StatefulWidget {
  const RecoWebViewDialog({Key key}) : super(key: key);

  @override
  _RecoWebViewDialog createState() => _RecoWebViewDialog();
}

class _RecoWebViewDialog extends State<RecoWebViewDialog> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
          return false;
        }
        return true;
      },
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: Container(
          color: Color(0xff222529),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(12),
                  minWidth: 0,
                  color: const Color(0xffF2F2F2),
                  onPressed: () => Navigator.maybePop(context),
                  child: BackButtonIcon(),
                ),
              ),
              Expanded(
                child: InAppWebView(
                  initialUrl:
                      "https://www.tiktok.com/@nathangrayy/video/6905061246006037766?sender_device=pc&sender_web_id=6898269561674876421&is_from_webapp=v2",
                ),
              ),
              if (!_focusNode.hasFocus) ...[
                IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: RecoEngagmentButtons(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => SingleRecoScreen(),
                    ));
                  },
                  child: Text(
                    'View All Replies',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: const Color(0xffFFFCFC),
                      decorationThickness: 0.5,
                    ),
                  ),
                ),
              ],
              replyField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget replyField() {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: const Color(0xffFFFCFC), width: 0.25),
    );
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: _focusNode.hasFocus ? 0 : 22,
      ),
      decoration: BoxDecoration(
        border: _focusNode.hasFocus
            ? Border.all(color: Color(0xff989797), width: 0.5)
            : null,
        color: _focusNode.hasFocus ? Colors.white : null,
      ),
      child: Column(
        children: [
          if (_focusNode.hasFocus)
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 16),
              child: RichText(
                text: TextSpan(
                  text: 'Replying in ',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Doja Tweets',
                      style: TextStyle(color: Color(0xff6C6D6D)),
                    ),
                  ],
                ),
              ),
            ),
          TextField(
            focusNode: _focusNode,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff222529),
              contentPadding: EdgeInsets.all(12),
              isDense: true,
              hintText:
                  _focusNode.hasFocus ? 'Your Reply' : 'Reply to this dig',
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder,
              focusedErrorBorder: inputBorder,
              errorBorder: inputBorder,
              suffixIconConstraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Color(0xffA5BEFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_focusNode.hasFocus)
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SingleRecoScreen(),
                ));
              },
              child: Text(
                'Reply in parent space instead',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
