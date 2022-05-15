import 'package:dokuz10_web/widgets/change_theme_button_widget.dart';
import 'package:dokuz10_web/widgets/responsive.dart';
import 'package:dokuz10_web/widgets/sign_in_form_box_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  Function switchPage;

  SignIn({
    required this.switchPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Responsive(
        mobile: Container(),
        tablet: Container(),
        desktop: _SignInDesktop(switchPage: switchPage),
      ),
    );
  }
}

// ignore: must_be_immutable
class _SignInDesktop extends StatelessWidget {
  Function switchPage;

  _SignInDesktop({
    required this.switchPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SignInFormBoxWidget(
        switchPage: switchPage,
      ),
    );
  }
}
