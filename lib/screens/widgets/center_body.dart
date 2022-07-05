import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:main_page_concept/UI/custom_icons.dart';

import '../../UI/colors.dart';

class CenterBody extends StatefulWidget {
  const CenterBody({Key? key}) : super(key: key);

  @override
  State<CenterBody> createState() => _CenterBodyState();
}

Widget bonusButton(void Function() onPressed) {
  return Container(
    height: 88,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            gradientBlue,
            gradientGreen,
            gradientLightGreen,
          ]),
    ),
    child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          //minimumSize: MaterialStateProperty.all(Size(double.infinity, 60)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '🎁',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Получи 10 бонусов',
                      style: TextStyle(
                        color: primaryColor,
                        fontFamily: 'SFProRounded',
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'привязав карту к счету Peyk',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}

Widget textInput() {
  return SizedBox(
    height: 70,
    child: TextField(
      cursorColor: primaryColor,
      style: const TextStyle(
        color: primaryColor,
        fontFamily: 'SFProRounded',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: primaryColor,
          fontFamily: 'SFProRounded',
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: const Icon(
          CustomIcons.qrCodeIcon,
          color: primaryColor,
          size: 22,
        ),
        filled: true,
        fillColor: appBarColor,
        hoverColor: appBarColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            )),
        labelText: 'Введите название услуги',
      ),
    ),
  );
}

Widget myBillsButton(void Function() onPressed, int badgeCounter) {
  return Badge(
    badgeContent: Center(
      child: Text(badgeCounter.toString(),
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
      ),
    ),
    padding: EdgeInsets.all(10),
    position: BadgePosition.topEnd(top: 25, end: 15),
    badgeColor: notificationColor,
    toAnimate: false,
    ignorePointer: true,
    child: Container(
      height: 88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: primaryColor,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          //minimumSize: MaterialStateProperty.all(Size(double.infinity, 60)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              const Icon(CustomIcons.inCircle, color: appBarColor, size: 55,),
              Padding(padding: const EdgeInsets.only(left: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Мои счета к оплате',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('Azərsu, Azeriqaz и другие',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _CenterBodyState extends State<CenterBody> {
  int badgeCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Оплати счета и услуги',
            style: TextStyle(
              color: primaryColor,
              fontFamily: 'SFProRounded',
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'и получи XX% кэшбек 💸',
            style: TextStyle(
              color: primaryColor,
              fontFamily: 'SFProRounded',
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 24, left: 24),
          child: textInput(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 21, right: 24, left: 24),
          child: myBillsButton(() {
            setState((){
              badgeCounter += 1;
            });
          }, badgeCounter),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, top: 90, left: 24),
          child: bonusButton(() {}),
        ),
      ],
    );
  }
}
