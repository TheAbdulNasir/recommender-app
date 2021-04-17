import 'package:flutter/material.dart';

class DummySpaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width * 0.42;
    final h = 240.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.rotate(
              angle: -0.153,
              child: SizedBox(
                width: w,
                height: h,
                child: DummySpaceCard(
                  title: 'Fav SpongeBob Memes',
                  subscribers: 150,
                  thumbnail:
                      'https://ftw.usatoday.com/wp-content/uploads/sites/90/2017/05/spongebob.jpg',
                  createdBy: 'BeyondMemes',
                  avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Transform.rotate(
              angle: 0.25,
              child: SizedBox(
                width: w,
                height: h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: DummySpaceCard(
                    title: 'Best Gossip Girl Tweets',
                    thumbnail:
                        'https://fr.web.img5.acsta.net/r_1920_1080/pictures/18/10/31/16/41/2588516.jpg',
                    createdBy: 'BeyondMemes',
                    avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
                    subscribers: 1200,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DummySpaceCard extends StatelessWidget {
  final String title, thumbnail, createdBy, avatarUrl;
  final int subscribers;

  const DummySpaceCard({
    Key key,
    @required this.title,
    @required this.subscribers,
    @required this.thumbnail,
    @required this.createdBy,
    @required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE6E4E1)),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 2),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE6E4E1)),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.fromLTRB(2, 4, 2, 0),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: actualBody(context),
        ),
      ],
    );
  }

  Widget actualBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE6E4E1)),
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).canvasColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '$subscribers Subscribers',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 9,
                      color: Color(0xff8B8B8B),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff8B8B8B)),
                    borderRadius: BorderRadius.circular(38),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 8,
                      color: Color(0xff8B8B8B),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    thumbnail,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Created By',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          createdBy,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Color(0xff8B8B8B),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
