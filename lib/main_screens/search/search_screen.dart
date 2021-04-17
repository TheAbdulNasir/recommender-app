import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/search/SearchBody.dart';

class SearchScreen extends StatefulWidget {
  final VoidCallback onBack;
  const SearchScreen({Key key, this.onBack}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButton(onPressed: widget.onBack),
      // ),
      body: SafeArea(child: SearchBody()),
    );
  }
}
