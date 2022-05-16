import 'package:flutter/material.dart';

class HomePageAppBarUserInfo extends StatelessWidget {
  final String name;

  const HomePageAppBarUserInfo({
    required this.name,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Text(name+" Halısaha"),
          const SizedBox(width: 10,),
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              name[0].toUpperCase() + "H",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),
          const SizedBox(width: 5,),
        ],
      ),
    );
  }
}
