import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarot/common/utils/widgets/loading_indicator.dart';
import 'package:tarot/common/utils/widgets/spacing.dart';
import 'package:tarot/di/injection.dart';
import 'package:tarot/pages/bloc/features_cubit.dart';
import 'package:tarot/pages/bloc/features_state.dart';
import 'package:tarot/pages/route/app_route.dart';
import 'package:tarot/pages/route/navigator.dart';

import '../common/enums/request_status.dart';
import '../common/resources/index.dart';
import '../entities/category.dart';

class FeaturePage extends StatefulWidget {
  const FeaturePage({Key? key, required this.isOneTopic}) : super(key: key);

  final bool isOneTopic;

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {

  final FeaturesCubit _bloc = getIt<FeaturesCubit>();

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
              left: 16,
              right: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    final topSafeArea = MediaQuery.of(context).padding.top;
    const double itemPadding = 16;
    final itemSize = (MediaQuery.of(context).size.width - itemPadding * 3) / 2;
    return BlocConsumer<FeaturesCubit, FeaturesState>(
      listener: (context, state) {
        switch (state.requestStatus) {
          case RequestStatus.initial:
            break;
          case RequestStatus.requesting:
            IgnoreLoadingIndicator().show(context);
            break;
          case RequestStatus.success:
            IgnoreLoadingIndicator().hide(context);
            break;
          case RequestStatus.failed:
            IgnoreLoadingIndicator().hide(context);
            break;
        }
      },
      builder: (context, state) {
        final categories =
        state.categories?.where((element) => (element.key?.isHomeTab ?? false) == widget.isOneTopic).toList();
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
                      Strings.localized.watchTarotOnline,
                      style: TextStyles.whiteNormalMedium,
                    ),
                    Text(
                      Strings.localized.homeHeader,
                      style: TextStyles.whiteExtraSmallRegular,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => _onItemTapped(state.categories?[index]),
                      child: SizedBox(
                        height: itemSize,
                        width: itemSize,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: itemSize,
                              width: itemSize,
                              decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(itemSize/2),
                                  border: Border.all(color: AppColors.white)),
                              child: Center(
                                child: (categories?[index].key?.image ?? '')
                                    .toImage(color: AppColors.white, height: 70, width: 70),
                              ),
                            ),
                            const TitleSpacing(),
                            Text(
                              categories?[index].name ?? '',
                              style: TextStyles.whiteSmallMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: categories?.length ?? 0,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: itemPadding,
                crossAxisSpacing: itemPadding,
                mainAxisExtent: itemSize + 30,
              ),
            ),
          ],
        );
      }
    );
  }

  void _onItemTapped(Category? category) {
    AppNavigator.pushNamed(RouterName.randomOneTarotDetail, arguments: category);
  }
}
