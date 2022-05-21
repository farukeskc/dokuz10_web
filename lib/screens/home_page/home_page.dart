import 'package:dokuz10_web/services/auth.dart';
import 'package:dokuz10_web/widgets/add_new_event.dart';
import 'package:dokuz10_web/widgets/calendar_widget.dart';
import 'package:dokuz10_web/widgets/change_theme_button_widget.dart';
import 'package:dokuz10_web/widgets/home_page_app_bar_user_info.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              await addNewEventDialog(context, DateTime.now(), const TimeOfDay(hour: 21, minute: 0));
            },
            color: Colors.white,
            icon: const Icon(Icons.add),
          ),
          GestureDetector(
            onTap: () {
              _key.currentState?.openEndDrawer();
            },
            child: const HomePageAppBarUserInfo(name: "Faruk"),
          ),
        ],
      ),
      body: const Center(
        child: CalendarWidget()
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Row(
              children: const [
                ChangeThemeButtonWidget(),
                SizedBox(
                  width: 5,
                ),
                Text("Karanlık Mod"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => itemsFunctions[index](),
                    title: Row(
                      children: [
                        itemsIcons[index],
                        const SizedBox(
                          width: 5,
                        ),
                        Text(itemsText[index]),
                      ],
                    ),
                  );
                },
                itemCount: itemsText.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
