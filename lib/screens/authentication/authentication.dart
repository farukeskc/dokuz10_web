import 'package:dokuz10_web/screens/authentication/register_page.dart';
import 'package:dokuz10_web/screens/authentication/sign_in_page.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool page = true;

  void switchPage() {
    setState(() {
      page = !page;
    });
  }


  @override
  Widget build(BuildContext context) {
    return page ? SignIn(switchPage: switchPage,): Register(switchPage: switchPage,);
  }
}

