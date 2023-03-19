import 'package:flutter/material.dart';
import 'package:ultimate_alarm_clock/utils/app_styles.dart';
import 'package:ultimate_alarm_clock/utils/app_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:ultimate_alarm_clock/screens/alarm_components/edit_alarm.dart';
import 'package:ultimate_alarm_clock/screens/alarm_components/ring.dart';
import 'package:ultimate_alarm_clock/widgets/alarm_tile.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {

  late List<AlarmSettings> alarms;

  static StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    loadAlarms();
    subscription ??= Alarm.ringStream.stream.listen(
      (alarmSettings) => navigateToRingScreen(alarmSettings),
    );
  }

  void loadAlarms() {
    setState(() {
      alarms = Alarm.getAlarms();
      alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    });
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AlarmRingScreen(alarmSettings: alarmSettings),
        ));
    loadAlarms();
  }

  Future<void> navigateToAlarmScreen(AlarmSettings? settings) async {
    final res = await showModalBottomSheet<bool?>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.6,
            child: AlarmEditScreen(alarmSettings: settings),
          );
        });

    if (res != null && res == true) loadAlarms();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.primaryColor,
        body: Container(
          padding: EdgeInsets.only(left: AppLayout.getWidth(30), right: AppLayout.getWidth(30), top: AppLayout.getHeight(30)),
          //Started with creating the UI of AlarmPage
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            //Creating the top bar of AlarmPage
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Alarms", style: Styles.headLineStyle1.copyWith(fontSize: 30)),
                CircleAvatar(
                radius: 30,
                backgroundColor: Styles.navigationBar,
                child: IconButton(
                  icon: Icon(
                    FluentSystemIcons.ic_fluent_add_filled,
                    color: Colors.white,
                    size: AppLayout.getWidth(30),
                  ),
                  onPressed: () => navigateToAlarmScreen(null),
                ),
              ),
            ],),
            //Now here comes the list of alarms
             SizedBox(height: AppLayout.getHeight(25)),
            Expanded(child: alarms.isNotEmpty
            ? ListView.separated(
                itemCount: alarms.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return AlarmTile(
                    key: Key(alarms[index].id.toString()),
                    title: TimeOfDay(
                      hour: alarms[index].dateTime.hour,
                      minute: alarms[index].dateTime.minute,
                    ).format(context),
                    onPressed: () => navigateToAlarmScreen(alarms[index]),
                    onDismissed: () {
                      Alarm.stop(alarms[index].id).then((_) => loadAlarms());
                    },
                  );
                },
              )
            : Center(
                child: Text(
                  "No alarms set",
                  style: Styles.headLineStyle1.copyWith(fontSize: 30)
                ),
              ), 
            )
            
            ]),
        )
      ),
    );
  }
}