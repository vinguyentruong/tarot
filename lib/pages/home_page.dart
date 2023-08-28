import 'package:flutter/material.dart';
import 'package:tarot/common/event/event_bus_mixin.dart';
import 'package:tarot/common/resources/index.dart';
import 'package:tarot/pages/questions_page.dart';
import 'package:tarot/pages/tarots_page.dart';

import 'features_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with EventBusMixin {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const FeaturePage(isOneTopic: true),
    const FeaturePage(isOneTopic: false),
    const QuestionsPage(),
    const TarotsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: SafeArea(
        bottom: false,
        child: BottomNavigationBar(
          backgroundColor: AppColors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.gray500,
          selectedLabelStyle: TextStyles.primaryExtraSmallMedium.copyWith(fontSize: 10),
          unselectedLabelStyle: TextStyles.greyExtraSmallMedium.copyWith(fontSize: 10),
          currentIndex: _currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (int index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: AssetImages.icHome.toImage(color: AppColors.white),
              label: '',
              activeIcon: AssetImages.icHome.toImage(color: AppColors.yellow),
            ),
            BottomNavigationBarItem(
              icon: AssetImages.icHeart.toImage(color: AppColors.white),
              label: '',
              activeIcon: AssetImages.icHeart.toImage(color: AppColors.pink),
            ),
            BottomNavigationBarItem(
              icon: AssetImages.icQuestions.toImage(color: AppColors.white),
              label: '',
              activeIcon: AssetImages.icQuestions.toImage(color: AppColors.yellow),
            ),
            BottomNavigationBarItem(
              icon: AssetImages.icTarot.toImage(color: AppColors.white),
              label: '',
              activeIcon: AssetImages.icTarot.toImage(color: AppColors.yellow),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
