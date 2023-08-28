import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarot/common/utils/widgets/default_image_widget.dart';
import 'package:tarot/common/utils/widgets/spacing.dart';
import 'package:tarot/di/injection.dart';
import 'package:tarot/entities/category.dart';
import 'package:tarot/pages/bloc/random_cards_cubit.dart';
import 'package:tarot/pages/bloc/random_cards_state.dart';
import 'package:tarot/pages/widgets/default_app_bar.dart';

import '../common/enums/request_status.dart';
import '../common/resources/index.dart';
import '../common/utils/extensions/buildcontext_extension.dart';

class RandomOneTarotDetailArgs {
  final Category? category;
  final int numOfTarot;

  RandomOneTarotDetailArgs({
    this.category,
    this.numOfTarot = 1,
  });
}

class RandomOneTarotDetailPage extends StatefulWidget {
  const RandomOneTarotDetailPage({Key? key}) : super(key: key);

  @override
  State<RandomOneTarotDetailPage> createState() => _RandomOneTarotDetailPageState();
}

class _RandomOneTarotDetailPageState extends State<RandomOneTarotDetailPage> {
  int _guideIndex = 1;
  int _drawIndex = 0;

  final List<String> _guideTitles = [
    Strings.localized.guideTitle1,
    Strings.localized.guideTitle2,
    Strings.localized.guideTitle3,
    Strings.localized.guideTitle4,
  ];

  final List<String> _guideContents = [
    Strings.localized.guideContent1,
    Strings.localized.guideContent2,
    Strings.localized.guideContent3,
    Strings.localized.guideContent4,
  ];

  final RandomCardsCubit _bloc = getIt<RandomCardsCubit>();

  @override
  Widget build(BuildContext context) {
    final RandomOneTarotDetailArgs? args = context.getRouteArguments();
    return BlocProvider(
      create: (_) => _bloc..initData(args?.category),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            AssetImages.imgBackGroundDetail.toImage(fit: BoxFit.cover),
            Positioned.fill(
              child: _content(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return BlocConsumer<RandomCardsCubit, RandomCardsState>(listener: (context, state) {
      switch (state.requestStatus) {
        case RequestStatus.initial:
          // TODO: Handle this case.
          break;
        case RequestStatus.requesting:
          // TODO: Handle this case.
          break;
        case RequestStatus.success:
          // TODO: Handle this case.
          break;
        case RequestStatus.failed:
          // TODO: Handle this case.
          break;
      }
    }, builder: (context, state) {
      return Column(
        children: [
          DefaultAppBar(
            backgroundColor: AppColors.transparent,
            title: Text(
              state.category?.name ?? Strings.localized.drawCards,
              style: TextStyles.whiteNormalMedium,
            ),
          ),
          if ((state.posts ?? []).isEmpty && state.requestStatus != RequestStatus.requesting)
            AssetImages.icTarotColor.toImage(height: 200, width: 200, fit: BoxFit.cover)
          else
            Container(
              height: 200,
              width: 130,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.yellow,
                  ),
                  borderRadius: BorderRadius.circular(6)),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: DefaultImageWidget(
                      state.cards
                          ?.firstWhereOrNull((element) => element.id == state.posts?[_drawIndex]?.first.cardId)
                          ?.image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.fitHeight,
                      defaultWidget: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellow,
                          strokeWidth: 1,
                        ),
                      ),
                    ),
                  ),
                  if (state.requestStatus == RequestStatus.requesting)
                    Positioned.fill(
                      child: Image.asset(
                        AssetImages.gifTarot,
                        height: 200,
                        width: 200,
                      ),
                    ),
                ],
              ),
            ),
          const Spacing(),
          TextButton(
            onPressed: () => _bloc.drawMultipleCard(1),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(6)),
              padding: const EdgeInsets.all(8),
              child: Text(
                (state.posts ?? []).isEmpty
                    ? Strings.localized.drawCards
                    : Strings.localized.drawAgain,
                style: TextStyles.whiteNormalBold,
              ),
            ),
          ),
          if ((state.posts ?? []).isEmpty) _guideContent() else _postContent(state)
        ],
      );
    });
  }

  Widget _postContent(RandomCardsState state) {
    return Expanded(
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              // color: AppColors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.yellow,
              )),
          child: ListView.builder(
            itemCount: state.posts?.length ?? 0,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...(state.posts?[index] ?? []).map((e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.ac_unit,
                                  color: AppColors.yellow,
                                  size: 15,
                                ),
                                const TitleSpacing(),
                                Text(
                                  e.rawType ?? '',
                                  style: TextStyles.whiteNormalBold.copyWith(color: AppColors.yellow),
                                ),
                              ],
                            ),
                            const TitleSpacing(),
                            Text(
                              e.content?.trim() ?? '',
                              style: TextStyles.whiteSmallRegular.copyWith(color: AppColors.white),
                            ),
                            const Spacing(),
                          ],
                        ))
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  Widget _guideContent() {
    return Expanded(
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              // color: AppColors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.yellow)),
          child: Column(
            children: [
              Text(
                Strings.localized.noteBeforeDrawingCards,
                style: TextStyles.whiteNormalBold,
              ),
              const Spacing(),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _guideButton(1, _guideIndex == 1),
                      const TitleSpacing(),
                      _guideButton(2, _guideIndex == 2),
                      const TitleSpacing(),
                      _guideButton(3, _guideIndex == 3),
                      const TitleSpacing(),
                      _guideButton(4, _guideIndex == 4),
                    ],
                  ),
                  const Spacing(),
                  Text(
                    _guideTitles[_guideIndex - 1],
                    style: TextStyles.blackSmallBold,
                  ),
                  const Spacing(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _guideContents[_guideIndex - 1],
                      style: TextStyles.whiteSmallRegular,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Material _guideButton(int index, bool selected) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            _guideIndex = index;
          });
        },
        child: Ink(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: selected
                    ? AppColors.gray500.withOpacity(0.5)
                    : AppColors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected ? AppColors.yellow : AppColors.transparent,
                )),
            child: Center(
                child: Text(
              index.toString(),
              style: TextStyles.whiteNormalBold,
            ))),
      ),
    );
  }
}
