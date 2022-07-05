import 'package:flutter/material.dart';
import 'package:main_page_concept/UI/colors.dart';
import 'package:main_page_concept/UI/custom_icons.dart';

class MainPageAppBar extends StatefulWidget {
  const MainPageAppBar({Key? key}) : super(key: key);

  @override
  State<MainPageAppBar> createState() => _MainPageAppBarState();
}

Widget bonusIconButton(void Function() onPressed){
  return Container(
    width: 47,
    height: 31,
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
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        //minimumSize: MaterialStateProperty.all(Size(double.infinity, 60)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      child: const Text(
        '🎁',
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    ),
  );
}

Widget userIcon(bool isOnline) {
  Color onlineColor = gradientGreen;
  isOnline ? onlineColor = gradientGreen : onlineColor = Colors.grey;
  return Stack(
    children: [
      IconButton(
        onPressed: (){},
        icon: Icon(CustomIcons.userIcon, size: 27, color: gradientGreen,),
      ),
      Positioned(
        left: 7,
        top: 20,
        child: Container(
          decoration: BoxDecoration(
            color: onlineColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(7),
          ),
          constraints: const BoxConstraints(
            minWidth: 10,
            minHeight: 10,
          ),
          child: const SizedBox(
            width: 1,
            height: 1,
          ),
        ),
      ),
    ],
  );

}

class _MainPageAppBarState extends State<MainPageAppBar> {
  final String currencySymbol = '₼';
  @override
  Widget build(BuildContext context) {
    bool isUserOnline = true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 43, top: 12, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //bonusIconButton((){print('bonus');}),
              //userIcon(isUserOnline),
            ],
          ),
        ),
        Row(
          children: const [
            Text(
              'Баланс Payk',
              style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: primaryColor),
            ),
          ],
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: '487,7 ',
                    style: TextStyle(
                        fontFamily: 'SFProRounded',
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: primaryColor)),
                TextSpan(
                    text: currencySymbol,
                    style: const TextStyle(
                        fontFamily: 'SFProRounded',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: primaryColor)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 13),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CustomIcons.add,
                    color: primaryColor,
                    size: 30,
                  )
              ),
            ),

          ],
        )
      ],
    );
  }
}
