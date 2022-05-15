import 'package:dokuz10_web/models/constants.dart';
import 'package:dokuz10_web/provider/theme_provider.dart';
import 'package:dokuz10_web/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignInFormBoxWidget extends StatelessWidget {
  Function switchPage;

  SignInFormBoxWidget({
    required this.switchPage,
    Key? key,
  }) : super(key: key);

  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
        boxShadow: themeProvider.isDarkMode
            ? []
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  decoration: authInputDecoration.copyWith(
                    hintText: "E-posta",
                  ),
                  onChanged: (text) {
                    email = text;
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  decoration: authInputDecoration.copyWith(
                    hintText: "Şifre",
                  ),
                  onChanged: (text) {
                    password = text;
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "",
                    ),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(0, 55),
                  ),
                  onPressed: () async {
                    await AuthServices()
                        .signInWithEmailAndPassword(email, password);
                  },
                  child: const Text('Giriş Yap'),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      // ignore: avoid_print
                      print("Şifremi Unuttum");
                    },
                    child: const Text(
                      'Şifremi Unuttum',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      width: 350,
      height: 240,
    );
  }
}
