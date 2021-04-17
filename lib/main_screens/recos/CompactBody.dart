import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/recos/content_control/WebView.dart';

class CompactRecoBody extends StatefulWidget {
  final double imageHeight;

  const CompactRecoBody({Key key, this.imageHeight = 80}) : super(key: key);

  @override
  _CompactRecoBodyState createState() => _CompactRecoBodyState();
}

class _CompactRecoBodyState extends State<CompactRecoBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/images/tiktok.png'),
              ),
              const SizedBox(width: 12),
              Text(
                '🔥 Tik Toks',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                '2 hrs ago',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (_) => RecoWebViewDialog(),
            );
          },
          child: Container(
            height: widget.imageHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://static.independent.co.uk/2020/12/02/20/sashaobama.jpg?width=1200"),
              ),
            ),
          ),
        ),
        Container(
          color: Color(0xffECEBEB),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/tiktokLogo.png'),
                radius: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'jimyoungsta on TikTok',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'vm.tiktok.com',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (_) => RecoWebViewDialog(),
                  );
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Text(
                    'View',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'missyme',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'sasha living her best life',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'View All Replies',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Colors.black54,
              decoration: TextDecoration.underline,
              decorationThickness: 0.4,
            ),
          ),
        ),
      ],
    );
  }
}
