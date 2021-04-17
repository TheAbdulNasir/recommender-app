import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_app/main_middleman.dart';
import 'package:sharing_app/providers/UserProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: UserState())],
      child: MaterialApp(
        title: 'Share App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          fontFamily: 'WorkSans',
          // ignore: deprecated_member_use
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.black, fontFamily: "Aveny"),
          ),
          // ignore: deprecated_member_use
          textTheme: TextTheme(
            title: TextStyle(color: Colors.black),
          ),
          appBarTheme: AppBarTheme(
            color: Color(0xfff8faf8),
            centerTitle: true,
            elevation: 1.0,
          ),
        ),
        home: MainMiddleMan(),
      ),
    );
  }
}
