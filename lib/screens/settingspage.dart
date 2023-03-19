import 'package:flutter/material.dart';
import 'package:ultimate_alarm_clock/utils/app_styles.dart';
import 'package:ultimate_alarm_clock/utils/app_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.primaryColor,
        body: ListView(
          padding: EdgeInsets.only(left: AppLayout.getWidth(30), right: AppLayout.getWidth(30), top: AppLayout.getHeight(30)),
          //Started with creating the UI of AlarmPage
          children: [Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            //Creating the top bar of AlarmPage
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Profile", style: Styles.headLineStyle1.copyWith(fontSize: 30)),
                CircleAvatar(
                radius: 30,
                backgroundColor: Styles.navigationBar,
                child: IconButton(
                  icon: Icon(
                    FluentSystemIcons.ic_fluent_person_available_filled,
                    color: Colors.white,
                    size: AppLayout.getWidth(30),
                  ),
                  onPressed: () {
                    print("I'm pressed");
                  },
                ),
              ),
            ],),
            //Now here comes the detail of user
             SizedBox(height: AppLayout.getHeight(25)),          
            CircleAvatar(
                radius: AppLayout.getWidth(70),
                backgroundImage: const AssetImage("assets/images/profile.jpg"),
              ),
              Text("Lakshya Sarve", style: Styles.headLineStyle1.copyWith(fontSize: 35)),
                Text("Ambikapur", style: Styles.textStyle2),
                
            //Here comes the setting options available to the user    
            SizedBox(height: AppLayout.getHeight(35)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Styles.primaryColor,
                boxShadow: [
                  BoxShadow(color: Styles.textColor1, spreadRadius: 1),
                ],
              ),
              child: Column(
                children: [
                  settingOptionsUser(optionIcon: FluentSystemIcons.ic_fluent_settings_filled, optionName: "Settings",),
                  SizedBox(height: AppLayout.getHeight(25)),
                  settingOptionsUser(optionIcon: FluentSystemIcons.ic_fluent_lock_shield_filled, optionName: "Privacy",),
                  SizedBox(height: AppLayout.getHeight(25)),
                  settingOptionsUser(optionIcon: FluentSystemIcons.ic_fluent_help_circle_filled, optionName: "Help",),
                  SizedBox(height: AppLayout.getHeight(25)),
                  settingOptionsUser(optionIcon: FluentSystemIcons.ic_fluent_sign_out_filled, optionName: "Logout",),
                ],
              ),
            ),
            
            ]),
          ]
        )
      ),
    );
  }
}

class settingOptionsUser extends StatelessWidget {
  settingOptionsUser({
    super.key, required this.optionIcon, required this.optionName
  });
  final String optionName;
  final IconData optionIcon;

  @override
  Widget build(BuildContext context) {
    return Row(  
     mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(optionIcon,
        color: Colors.white,
        size: AppLayout.getWidth(30),),
        SizedBox(width: AppLayout.getWidth(10),),
        Text(optionName, style: Styles.headLineStyle1.copyWith(fontSize: 18, height: 1)),
      ],),
        Icon(FluentSystemIcons.ic_fluent_chevron_right_filled,
        color: Colors.white,
        size: AppLayout.getWidth(20),),
    ]);
  }
}