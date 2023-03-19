import 'package:flutter/material.dart';
import 'package:ultimate_alarm_clock/utils/app_styles.dart';
import 'package:ultimate_alarm_clock/utils/app_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
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
              Text("Your Circle", style: Styles.headLineStyle1.copyWith(fontSize: 30)),
                CircleAvatar(
                radius: 30,
                backgroundColor: Styles.navigationBar,
                child: IconButton(
                  icon: Icon(
                    FluentSystemIcons.ic_fluent_person_add_filled,
                    color: Colors.white,
                    size: AppLayout.getWidth(30),
                  ),
                  onPressed: () {
                    print("I'm pressed");
                  },
                ),
              ),
            ],),
            //Now here comes the list of shared alarms
             SizedBox(height: AppLayout.getHeight(25)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Styles.cardColor1,
                boxShadow: [
                  BoxShadow(color: Styles.cardColor1, spreadRadius: 3),
                ],
              ),
              child: Column(
                children: [
                  Row(  
                   mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                      children: [
                        Text("09:00", style: Styles.headLineStyle1.copyWith(fontSize: 40)),
                         Text("AM", style: Styles.headLineStyle1.copyWith(fontSize: 15)),
                      ],
                    ),
                     Text("Pick Alex From Strampton", style: Styles.headLineStyle3.copyWith(fontSize: 12, height: 0.5)),
                    SizedBox(height: AppLayout.getHeight(10)),
                  ],),
                  Switch(
                    // This bool value toggles the switch.
                    value: true,
                    activeColor: Styles.primaryColor,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        
                     });
                    },
                  )
                  ]),
                  Divider(
                    color: Styles.primaryColor,
                  ),
                  Row(children: [
                    CircleAvatar(
                radius: AppLayout.getWidth(15),
                backgroundImage: const AssetImage("assets/images/profile.jpg"),
              ),
              SizedBox(width: AppLayout.getWidth(10),),
              CircleAvatar(
                radius: AppLayout.getWidth(15),
                backgroundImage: const AssetImage("assets/images/chloe.png"),
              ),
                  ],)
                ],
              ),
            ),
            SizedBox(height: AppLayout.getHeight(25)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Styles.cardColor1,
                boxShadow: [
                  BoxShadow(color: Styles.cardColor1, spreadRadius: 3),
                ],
              ),
              child: Column(
                children: [
                  Row(  
                   mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                      children: [
                        Text("07:00", style: Styles.headLineStyle1.copyWith(fontSize: 40)),
                         Text("PM", style: Styles.headLineStyle1.copyWith(fontSize: 15)),
                      ],
                    ),
                     Text("Bring Groceries From Market", style: Styles.headLineStyle3.copyWith(fontSize: 12, height: 0.5)),
                    SizedBox(height: AppLayout.getHeight(10)),
                  ],),
                  Switch(
                    // This bool value toggles the switch.
                    value: true,
                    activeColor: Styles.primaryColor,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        
                     });
                    },
                  )
                  ]),
                  Divider(
                    color: Styles.primaryColor,
                  ),
                  Row(children: [
                    CircleAvatar(
                radius: AppLayout.getWidth(15),
                backgroundImage: const AssetImage("assets/images/profile.jpg"),
              ),
              SizedBox(width: AppLayout.getWidth(10),),
              CircleAvatar(
                radius: AppLayout.getWidth(15),
                backgroundImage: const AssetImage("assets/images/lisa.png"),
              ),
                  ],)
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