import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:main_page_concept/UI/colors.dart';

import 'package:main_page_concept/UI/button_bar_animated.dart';

class buttonBar extends StatefulWidget {
  const buttonBar({Key? key}) : super(key: key);

  @override
  State<buttonBar> createState() => _buttonBarState();
}

class _buttonBarState extends State<buttonBar> {
  bool qrPressed = true;
  bool sendPressed = false;
  bool billsPressed = false;
  bool showBadge = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedButtonBar(
      radius: 10.0,
      padding: const EdgeInsets.all(1),
      invertedSelection: false,
      foregroundColor: primaryColor,
      backgroundColor: backgroundColor,
      borderWidth: 1,
      borderColor: appBarColor,
      elevation: 0,
      showBadge: showBadge,
      badgePosition: BadgePosition.topEnd(top: 0, end: 3),
      children: [
        ButtonBarEntry(
            child: Text('QR',
                style: TextStyle(
                  color: qrPressed ? Colors.white : primaryColor,
                  fontFamily: 'SFProRounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
            onTap: () {
              setState(() {
                if (!qrPressed) {
                  qrPressed = !qrPressed;
                  sendPressed = false;
                  billsPressed = false;
                }
              });
            }),
        ButtonBarEntry(
            child: Text('Отправить',
                style: TextStyle(
                  color: sendPressed ? Colors.white : primaryColor,
                  fontFamily: 'SFProRounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
            onTap: () {
              setState(() {
                if (!sendPressed) {
                  sendPressed = !sendPressed;
                  qrPressed = false;
                  billsPressed = false;
                }
              });
            }),
        ButtonBarEntry(
            child: Text(
              'Счета',
              style: TextStyle(
                color: billsPressed ? Colors.white : primaryColor,
                fontFamily: 'SFProRounded',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              setState(() {
                if (!billsPressed) {
                  billsPressed = !billsPressed;
                  qrPressed = false;
                  sendPressed = false;
                }
              });
            }),

        // ElevatedButton(
        //     onPressed: () {
        //       setState((){
        //         if(!billsPressed) {
        //           billsPressed = !billsPressed;
        //           qrPressed = false;
        //           sendPressed = false;
        //         }
        //       });
        //     },
        //     child: Text('Счета', style: TextStyle(color: billsPressed ? Colors.white : primaryColor),),
        // ),
      ],
    );
  }
}
