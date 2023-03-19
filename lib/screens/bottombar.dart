import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:ultimate_alarm_clock/screens/alarmpage.dart';
import 'package:ultimate_alarm_clock/screens/friendspage.dart';
import 'package:ultimate_alarm_clock/screens/homepage.dart';
import 'package:ultimate_alarm_clock/screens/settingspage.dart';
import 'package:ultimate_alarm_clock/utils/app_layout.dart';
import 'package:ultimate_alarm_clock/utils/app_styles.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const AlarmPage(),
    const FriendsPage(),
    const SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Styles.navigationBar,
    boxShadow: [
      BoxShadow(color: Styles.navigationBar, spreadRadius: 3),
    ],
  ),
        margin: EdgeInsets.only(left: AppLayout.getWidth(30), right: AppLayout.getWidth(30), bottom: AppLayout.getHeight(30),top: AppLayout.getHeight(5)),
        child: BottomNavigationBar(
          
            backgroundColor: Styles.navigationBar,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xFF493b78),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_clock_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_clock_filled),
                  label: "Alarms"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_people_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_people_filled),
                  label: "Friends"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_filled),
                  label: "Settings"),
            ]),
      ),
    );
  }
}

