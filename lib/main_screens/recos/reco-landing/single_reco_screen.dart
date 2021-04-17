import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleRecoScreen extends StatefulWidget {
  @override
  _SingleRecoScreenState createState() => _SingleRecoScreenState();
}

class _SingleRecoScreenState extends State<SingleRecoScreen> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            topBar(),
            const SizedBox(height: 24),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (_focusNode.hasFocus) {
                    setState(() => _focusNode.unfocus());
                  }
                },
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ReplyTile(
                      imageUrl: 'https://i.pravatar.cc/300?u=missyme',
                      user: 'missyme',
                      reply:
                          'doja and saweetie always doing some hot girl shit',
                    ),
                    const SizedBox(height: 24),
                    ReplyTile(
                      imageUrl: 'https://i.pravatar.cc/300?u=missyme',
                      user: 'missyme',
                      reply: 'das my best friend',
                    ),
                    const SizedBox(height: 24),
                    ReplyTile(
                      imageUrl: 'https://i.pravatar.cc/300?u=missyme',
                      user: 'missyme',
                      reply: '😍',
                    ),
                    const SizedBox(height: 24),
                    ReplyTile(
                      imageUrl: 'https://i.pravatar.cc/300?u=missyme',
                      user: 'missyme',
                      reply: 'hot girl shit',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: _focusNode.hasFocus ? 48 : 22,
              ),
              decoration: BoxDecoration(
                border: _focusNode.hasFocus
                    ? Border.all(color: Color(0xff989797), width: 0.5)
                    : null,
              ),
              child: Row(
                children: [
                  if (!_focusNode.hasFocus) ...[
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/300?u=missyme',
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: TextField(
                      focusNode: _focusNode,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff222529),
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        hintText: 'Your Reply',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          FlatButton(
            shape: CircleBorder(),
            padding: const EdgeInsets.all(12),
            color: const Color(0xffF2F2F2),
            onPressed: () => Navigator.maybePop(context),
            child: BackButtonIcon(),
          ),
          Column(
            children: [
              Text(
                'Replies',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  'Replies from Doja Tweets.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO
                },
                child: Text(
                  'See replies from  parent space instead',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReplyTile extends StatelessWidget {
  final String user, reply, imageUrl;

  const ReplyTile({
    Key key,
    this.user,
    this.reply,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    user,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  reply,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
