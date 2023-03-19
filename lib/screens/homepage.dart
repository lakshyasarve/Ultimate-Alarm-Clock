import 'package:flutter/material.dart';
import 'package:ultimate_alarm_clock/utils/app_styles.dart';
import 'package:ultimate_alarm_clock/utils/app_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:intl/intl.dart';
import 'package:ultimate_alarm_clock/widgets/clock.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    
    var worldFormattedTime =  DateFormat.Hm().format(now);
    var formattedDate = DateFormat('MMMM d, y').format(now);
    var worldFormattedDate = DateFormat('EEEE d').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if(!timezoneString.startsWith('-')) offsetSign = '+';
  

    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.primaryColor,
        body: ListView(
          padding: EdgeInsets.only(left: AppLayout.getWidth(30), right: AppLayout.getWidth(30), top: AppLayout.getHeight(30)),
          //Started with creating the UI of HomeScreen
          children: [Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            //Creating the top bar of Homescreen
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Good Morning,", style: Styles.textStyle2.copyWith(fontSize: 16)),
                Text("Lakshya Sarve", style: Styles.headLineStyle1.copyWith(fontSize: 30),)
              ],),
              CircleAvatar(
                radius: AppLayout.getWidth(30),
                backgroundImage: const AssetImage("assets/images/profile.jpg"),
              ),
            ],),
            //Now here comes the clock widget
            SizedBox(height: AppLayout.getHeight(25)),
            // Container(child: Align(alignment: Alignment.center,child: ClockView(size: MediaQuery.of(context).size.height / 3.5 ,))),
            Center(child: Clock()),
            SizedBox(height: AppLayout.getHeight(25)),
            //Here comes the time system time
            Column(children: [
             const DigitalClockView(),
             Text(formattedDate, style: Styles.textStyle2.copyWith(fontSize: 24, height: 0.8)),
              SizedBox(height: AppLayout.getHeight(20)),
            ],),
            
            //Here comes the world clock section 
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Styles.cardColor1,
                boxShadow: [
                  BoxShadow(color: Styles.cardColor1, spreadRadius: 3),
                ],
              ),
              child: Row(  
               mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FluentSystemIcons.ic_fluent_globe_filled,
                  color: Colors.white,
                  size: AppLayout.getWidth(45),),
                  SizedBox(width: AppLayout.getWidth(10),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(worldFormattedDate, style: Styles.headLineStyle3.copyWith(fontSize: 15)),
                  Text("New York", style: Styles.headLineStyle1.copyWith(fontSize: 22, height: 1)),
                ],),
                ],),
              Text(worldFormattedTime, style: Styles.headLineStyle1.copyWith(fontSize: 32)),  
              ]),
            ),
            SizedBox(height: AppLayout.getHeight(25)),
            //Here comes the weather section
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),vertical: AppLayout.getHeight(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Styles.cardColor2,
                boxShadow: [
                  BoxShadow(color: Styles.cardColor2, spreadRadius: 3),
                ],
              ),
              child: Row(  
               mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FluentSystemIcons.ic_fluent_weather_partly_cloudy_day_filled,
                  color: Colors.white,
                  size: AppLayout.getWidth(45),),
                  SizedBox(width: AppLayout.getWidth(10),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Seattle", style: Styles.headLineStyle3.copyWith(fontSize: 15)),
                  Text("Sunny", style: Styles.headLineStyle1.copyWith(fontSize: 22, height: 1)),
                ],),
                ],),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("23", style: Styles.headLineStyle1.copyWith(fontSize: 32)),
                   Text("o", style: Styles.headLineStyle1.copyWith(fontSize: 10)),
                ],)
                
              ]),
            )
          ]),
          ]
        )
      ),
    );
  }
}

class DigitalClockView extends StatefulWidget {
  const DigitalClockView({super.key});

  @override
  State<DigitalClockView> createState() => _DigitalClockViewState();
}

class _DigitalClockViewState extends State<DigitalClockView> {
  var formattedTime =  DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Text(formattedTime, style: Styles.headLineStyle1.copyWith(fontSize: 45)
            );
  }
}