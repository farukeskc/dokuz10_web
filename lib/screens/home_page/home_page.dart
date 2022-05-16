import 'package:dokuz10_web/models/user.dart';
import 'package:dokuz10_web/services/auth.dart';
import 'package:dokuz10_web/widgets/home_page_app_bar_user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final List<String> itemsText = ["Çıkış Yap"];

  final List<Icon> itemsIcons = [const Icon(Icons.logout)];

  final List<Function> itemsFunctions = [AuthServices().signOut];

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserModel>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          GestureDetector(
              onTap: () {
                _key.currentState?.openEndDrawer();
              },
              child: const HomePageAppBarUserInfo(name: "Faruk"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(auth.uid),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => itemsFunctions[index](),
              title: Row(
                children: [
                  itemsIcons[index],
                  const SizedBox(width: 5,),
                  Text(itemsText[index]),
                ],
              ),
            );
          },
          itemCount: itemsText.length,
        ),
      ),
    );
  }
}