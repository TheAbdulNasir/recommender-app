import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/dms/ChatModel.dart';
import 'package:sharing_app/main_screens/dms/dm_individual_main.dart';

class DMAllMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  FlatButton(
                    shape: CircleBorder(),
                    padding: const EdgeInsets.all(12),
                    color: const Color(0xffF2F2F2),
                    onPressed: () => Navigator.maybePop(context),
                    child: BackButtonIcon(),
                  ),
                  const Spacer(),
                  FlatButton(
                    shape: CircleBorder(),
                    padding: const EdgeInsets.all(12),
                    color: const Color(0xffF2F2F2),
                    onPressed: () {},
                    child: Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Text(
                'Messages',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(Icons.search, color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  hintText: 'Search Messages',
                  filled: true,
                  fillColor: Color(0xffeeeeee),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                itemCount: ChatModel.dummyData.length,
                separatorBuilder: (_, __) => const SizedBox(height: 4),
                itemBuilder: (context, index) => ChatListTile(
                  chat: ChatModel.dummyData[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  final ChatModel chat;
  const ChatListTile({Key key, @required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => _goToMessage(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: chat.messagesCount != null && chat.messagesCount > 0
              ? const Color(0xff2F80ED).withOpacity(0.1)
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 24.0,
                  backgroundImage: NetworkImage(chat.avatarUrl),
                ),
                if (chat.availability != null)
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                      color: chat.statusColor,
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff1B1A57),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      chat.message,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xff4F5E7B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.datetime,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff333333),
                  ),
                ),
                const SizedBox(height: 8),
                if (chat.messagesCount != null && chat.messagesCount > 0)
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: const Color(0xff2F80ED),
                    child: Text(
                      '${chat.messagesCount}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  void _goToMessage(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DMIndividualMain()),
    );
  }
}
