import 'package:dokuz10_web/models/user.dart';
import 'package:dokuz10_web/provider/calendar_provider.dart';
import 'package:dokuz10_web/services/database.dart';
import 'package:dokuz10_web/widgets/calendar_body.dart';
import 'package:dokuz10_web/widgets/calendar_month_switch_widget.dart';
import 'package:dokuz10_web/widgets/calendar_top_bar.dart';
import 'package:dokuz10_web/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {


  bool loading = true;

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<UserModel>(context);
    return FutureBuilder(
      future: DBS(uid: _auth.uid).getEvents(context),
      builder: (context, _) {
        return ChangeNotifierProvider(
          create: (context) => CalendarProvider(),
          child: Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: Container(
              // height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CalendarMonthSwitch(),
                  const CalendarTopBar(),
                  CalendarBody(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

