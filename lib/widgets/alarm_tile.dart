import 'package:flutter/material.dart';
import 'package:ultimate_alarm_clock/utils/app_styles.dart';
import 'package:ultimate_alarm_clock/utils/app_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class AlarmTile extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final void Function()? onDismissed;

  const AlarmTile({
    Key? key,
    required this.title,
    required this.onPressed,
    this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: onDismissed != null
          ? DismissDirection.endToStart
          : DismissDirection.none,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        child: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) => onDismissed?.call(),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Container(
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
               Text(title, style: const TextStyle(
                       fontFamily: "Poppins",
                       fontSize: 28,
                       fontWeight: FontWeight.w600,
                       color: Colors.white,
                     ),),
                    Icon(FluentSystemIcons.ic_fluent_chevron_right_filled,
                    color: Colors.white,
                    size: AppLayout.getWidth(20),),
              ]),
            ),
      ),
    );
  }
}


