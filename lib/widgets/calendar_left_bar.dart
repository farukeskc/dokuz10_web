import 'package:flutter/material.dart';

class CalendarLeftBar extends StatelessWidget {
  const CalendarLeftBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 580,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LeftBarTile(index: 0,),
          LeftBarTile(index: 1,),
          LeftBarTile(index: 2,),
          LeftBarTile(index: 3,),
          LeftBarTile(index: 4,),
          LeftBarTile(index: 5,),
          LeftBarTile(index: 6,),
          LeftBarTile(index: 7,),
          LeftBarTile(index: 8,),
          LeftBarTile(index: 9,),
          LeftBarTile(index: 10,),
          LeftBarTile(index: 11,),
          LeftBarTile(index: 12,),
          LeftBarTile(index: 13,),
          LeftBarTile(index: 14,),
          LeftBarTile(index: 15,),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LeftBarTile extends StatelessWidget {
  int index;
  LeftBarTile({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    index = (index + 12) % 24;
    TimeOfDay time = TimeOfDay(hour: index, minute: 0);
    return Text(time.format(context));
  }
}
