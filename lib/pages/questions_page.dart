import 'package:flutter/material.dart';
import 'package:tarot/common/utils/widgets/spacing.dart';

import '../common/resources/index.dart';
import 'route/app_route.dart';
import 'route/navigator.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          AssetImages.imgBackGround.toImage(),
          Positioned.fill(
            child: _content(context),
            left: 16,
            right: 16,
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    final topSafeArea = MediaQuery.of(context).padding.top;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          expandedHeight: 80.0,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.only(
              top: topSafeArea + 8,
              left: 16,
              right: 16,
              // bottom: 8,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.localized.questions,
                  style: TextStyles.whiteNormalMedium,
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      onTap: () {
                        AppNavigator.pushNamed(RouterName.randomOneTarotDetail);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Question Name",
                              style: TextStyles.whiteSmallMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacing(),
                ],
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
