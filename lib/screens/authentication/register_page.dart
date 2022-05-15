import 'package:dokuz10_web/services/auth.dart';
import 'package:dokuz10_web/widgets/change_theme_button_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Function switchPage;

  Register({
    required this.switchPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', pass = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Email"),
            onChanged: (text) {
              email = text;
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Password"),
            onChanged: (text) {
              pass = text;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await AuthServices().registerWithEmailAndPassword(email, pass);
            },
            child: const Text('Register'),
          ),
          GestureDetector(
            onTap: () {
              switchPage();
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
