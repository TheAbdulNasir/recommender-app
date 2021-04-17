import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/search/BrowseAllSpaces.dart';
import 'package:sharing_app/main_screens/search/PopularSpaces.dart';
import 'package:sharing_app/main_screens/search/RecommendedSpaces.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  void _moreRecommendedSpaces() {
    print('more recommended spaces');
  }

  void _morePopularSpaces() {
    print('more popular spaces');
  }

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 21);
    const btnStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Search',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
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
                hintText: 'Search Spaces',
                filled: true,
                fillColor: Color(0xffeeeeee),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Recommended Spaces', style: titleStyle),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: RecommendedSpaces(),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: FlatButton(
              onPressed: _moreRecommendedSpaces,
              child: Text('View All Recommended Spaces', style: btnStyle),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Popular Spaces', style: titleStyle),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: PopularSpaces(),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: FlatButton(
              onPressed: _morePopularSpaces,
              child: Text('View All Trending Spaces', style: btnStyle),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Browse All Spaces', style: titleStyle),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          sliver: AllSpaces(),
        ),
      ],
    );
  }
}
