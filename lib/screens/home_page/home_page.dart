import 'package:dokuz10_web/models/user.dart';
import 'package:dokuz10_web/services/auth.dart';
import 'package:dokuz10_web/widgets/change_theme_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(auth.uid),
            ElevatedButton(onPressed: () async {
              await AuthServices().signOut();
            }, child: const Text('SignOut'))
          ],
        ),
      ),
    );
  }
}
