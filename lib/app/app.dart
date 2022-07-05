import 'package:flutter/material.dart';
import 'package:main_page_concept/screens/view/main_page.dart';

class MainPageApp extends StatelessWidget {
  const MainPageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main page concept',
      home:  MainPage(),
    );
  }
}
