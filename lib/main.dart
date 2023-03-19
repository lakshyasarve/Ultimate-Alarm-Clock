import 'package:flutter/material.dart';
import 'package:ultimate_alarm_clock/screens/bottombar.dart';
import 'package:alarm/alarm.dart';
import 'dart:async';
import 'package:flutter/services.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Alarm.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ultimate Alarm Clock",
      home: BottomBar(),
    );
  }
}