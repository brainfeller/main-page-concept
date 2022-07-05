import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_page_concept/UI/colors.dart';
import 'package:main_page_concept/screens/widgets/button_bar.dart';
import 'package:main_page_concept/screens/widgets/center_body.dart';

import '../widgets/app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: false,
        slivers: [
          SliverAppBar(
            leadingWidth: 100,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 23),
              child: bonusIconButton(() {}),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: userIcon(true),
              )
            ],
            pinned: true,
            expandedHeight: 200,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            collapsedHeight: 200,
            backgroundColor: appBarColor,
            flexibleSpace: const FlexibleSpaceBar(
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.only(left: 24, bottom: 27),
              centerTitle: false,
              title: SingleChildScrollView(
                child: MainPageAppBar(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 34, left: 20, right: 20),
              child: buttonBar(),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 70),
              child: CenterBody(),
            ),
          )
        ],
      ),
    );
  }
}
