import 'package:dokuz10_web/models/user.dart';
import 'package:dokuz10_web/screens/authentication/authentication.dart';
import 'package:dokuz10_web/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    return (user != null) ? const HomePage() : const Authentication();
  }
}
