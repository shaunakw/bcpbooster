import 'package:flutter/material.dart';
import 'constants.dart';
import 'pages/sign_in_page.dart';
import 'pages/profile_info_page.dart';
import 'pages/membership_page.dart';
import 'pages/misc_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor, // Hex: 2C3872
        scaffoldBackgroundColor: backgroundColor, // Hex: ABBAF2
        fontFamily: 'Avenir Next'
      ),
      routes: {
        '/sign_in': (_) => SignInPage(),
        '/profile_info': (_) => ProfileInfoPage(),
        '/membership': (_) => MembershipPage(),
        '/misc': (_) => MiscPage(),
      },
      initialRoute: '/sign_in',
    );
  }
}

