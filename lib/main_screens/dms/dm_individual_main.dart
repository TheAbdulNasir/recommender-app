import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/dms/chat_bubble.dart';

class DMIndividualMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Row(
                children: [
                  FlatButton(
                    shape: CircleBorder(),
                    padding: const EdgeInsets.all(12),
                    minWidth: 0,
                    color: const Color(0xffF2F2F2),
                    onPressed: () => Navigator.maybePop(context),
                    child: BackButtonIcon(),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/84.jpg',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fullsnack Designers',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff1B1A57),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '7 Online, from 12 people',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xff4F5E7B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    shape: CircleBorder(),
                    padding: const EdgeInsets.all(12),
                    color: const Color(0xffF2F2F2),
                    minWidth: 0,
                    onPressed: () {},
                    child: Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            Expanded(child: buildMessages()),
            Divider(indent: 8, endIndent: 8, thickness: 1, height: 0),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write a message...',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessages() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        userWhoIsntMe(),
        const SizedBox(height: 24),
        myMessages(),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffe7e7e7),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 24,
              width: 56,
              child: Icon(Icons.more_horiz),
            ),
            const SizedBox(width: 6),
            Stack(
              children: [
                typingAvatar(
                  'https://randomuser.me/api/portraits/women/88.jpg',
                  0,
                ),
                typingAvatar(
                  'https://randomuser.me/api/portraits/men/88.jpg',
                  1,
                ),
                typingAvatar(
                  'https://randomuser.me/api/portraits/women/32.jpg',
                  2,
                ),
              ],
            ),
            const SizedBox(width: 6),
            Text(
              '+2 others are typing',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff4F5E7B),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget typingAvatar(String url, int order) {
    return Container(
      margin: EdgeInsets.only(left: 18.0 * order),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: CircleAvatar(
        radius: 12,
        backgroundImage: NetworkImage(url),
      ),
    );
  }

  Widget userWhoIsntMe() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/81.jpg',
                ),
              ),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                  color: const Color(0xff4CE417),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                child: Text(
                  'Mike Mazowski',
                  style: TextStyle(color: const Color(0xffF2994A)),
                ),
              ),
              ChatBubble(
                body: 'Hello guys, we have discussed about post-corona '
                    'vacation plan and our decision is to go to Bali. We '
                    'will have a very big party after this corona ends! '
                    'These are some images about our destination',
                time: '4:04 PM',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 48, 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: Image.network(
                      'https://picsum.photos/seed/b/500/200',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 48),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            'https://picsum.photos/seed/a/400',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            'https://picsum.photos/seed/c/400',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }

  Widget myMessages() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(width: 48),
        Flexible(
          child: ChatBubble(
            body: "That’s very nice place! you guys made a very good decision. "
                "Can’t wait to go on vacation!",
            time: '4:04 PM',
            bubbleColor: Color(0xff2F80ED),
            textColor: Colors.white,
            timeColor: Colors.white70,
            isSender: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/81.jpg',
                ),
              ),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                  color: const Color(0xff4CE417),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
