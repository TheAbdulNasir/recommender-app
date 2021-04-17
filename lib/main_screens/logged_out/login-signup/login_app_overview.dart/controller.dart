import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/login_app_overview.dart/LoginOverviewCurate.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/login_app_overview.dart/LoginOverviewDiscover.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/login_app_overview.dart/LoginOverviewShare.dart';



class LoginAppOverview extends StatelessWidget {
  final controller = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return new PageView( 
      controller: controller,
      children: [
        LoginOverviewDiscover(),
        LoginOverviewCurate(),
        LoginOverviewShare(),
      ],
    );
  }
}
