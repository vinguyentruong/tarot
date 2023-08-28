import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarot/common/utils/widgets/default_image_widget.dart';
import 'package:tarot/common/utils/widgets/loading_indicator.dart';
import 'package:tarot/common/utils/widgets/spacing.dart';
import 'package:tarot/di/injection.dart';
import 'package:tarot/pages/bloc/card_detail_cubit.dart';
import 'package:tarot/pages/bloc/card_detail_state.dart';

import '../common/enums/request_status.dart';
import '../common/resources/index.dart';
import '../common/utils/extensions/buildcontext_extension.dart';
import '../entities/card.dart' as tarot;

class TarotDetailPage extends StatefulWidget {
  const TarotDetailPage({Key? key}) : super(key: key);

  @override
  State<TarotDetailPage> createState() => _TarotDetailPageState();
}

class _TarotDetailPageState extends State<TarotDetailPage> {
  final CardDetailCubit _bloc = getIt<CardDetailCubit>();

  @override
  Widget build(BuildContext context) {
    final tarot.Card? card = context.getRouteArguments();
    return BlocProvider<CardDetailCubit>(
      create: (_) => _bloc..initData(card),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            AssetImages.imgBackGroundDetail.toImage(fit: BoxFit.cover),
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
    return BlocConsumer<CardDetailCubit, CardDetailState>(listener: (context, state) {
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
    }, builder: (context, state) {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 80.0,
            backgroundColor: AppColors.transparent,
            elevation: 0,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                top: topSafeArea + 8,
                // bottom: 8,
              ),
              title: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: AssetImages.icBack.toImage(color: AppColors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        state.card?.name ?? Strings.localized.tarotDetail,
                        style: TextStyles.whiteNormalMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                DefaultImageWidget(
                  state.card?.image,
                  height: 250,
                  fit: BoxFit.fitHeight,
                ),
                const Spacing(),
                Text(
                  state.card?.content ?? '',
                  style: TextStyles.whiteSmallRegular,
                ),
                const Spacing(),
              ],
            ),
          )
        ],
      );
    });
  }
}
