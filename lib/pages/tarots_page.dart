import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarot/common/utils/widgets/spacing.dart';
import 'package:tarot/pages/bloc/cards_state.dart';
import 'package:tarot/pages/route/app_route.dart';
import 'package:tarot/pages/route/navigator.dart';

import '../common/resources/index.dart';
import '../common/utils/widgets/default_image_widget.dart';
import '../di/injection.dart';
import 'bloc/cards_cubit.dart';

class TarotsPage extends StatefulWidget {
  const TarotsPage({Key? key}) : super(key: key);

  @override
  State<TarotsPage> createState() => _TarotsPageState();
}

class _TarotsPageState extends State<TarotsPage> {
  final CardsCubit _bloc = getIt<CardsCubit>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc.initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            AssetImages.imgBackGround.toImage(),
            Positioned.fill(
              child: _content(context),
              right: 16,
              left: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    final topSafeArea = MediaQuery.of(context).padding.top;
    const double itemPadding = 16;
    final itemSize = (MediaQuery.of(context).size.width - itemPadding * 4) / 3;
    return BlocBuilder<CardsCubit, CardsState>(builder: (context, state) {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 60.0,
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
                    Strings.localized.tarots,
                    style: TextStyles.whiteNormalMedium,
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return InkWell(
                  onTap: () {
                    AppNavigator.pushNamed(RouterName.tarotDetail, arguments: state.cards?[index]);
                  },
                  child: Container(
                    height: itemSize,
                    width: itemSize,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: itemSize,
                          width: itemSize,
                          child: Center(
                            child: DefaultImageWidget(
                              state.cards?[index].image,
                              // height: 70,
                              // width: 70,
                              fit: BoxFit.cover,
                              defaultWidget: const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.yellow,
                                  strokeWidth: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const TitleSpacing(),
                        Text(
                          state.cards?[index].name ?? '',
                          style: TextStyles.whiteSmallMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: state.cards?.length ?? 0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: itemPadding,
                crossAxisSpacing: itemPadding,
                mainAxisExtent: itemSize + 40),
          ),
        ],
      );
    });
  }
}
