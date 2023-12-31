import 'package:flutter/material.dart';

import '../../common/resources/index.dart';
import '../route/navigator.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppBar({
    Key? key,
    this.titleText,
    this.title,
    this.trailingActions,
    this.leading,
    this.leadingColor,
    this.titleColor,
    this.backgroundColor,
    this.showNotificationAction = false,
    this.onBack,
  }) : super(key: key);

  final String? titleText;
  final Widget? title;
  final List<Widget>? trailingActions;
  final Widget? leading;
  final Color? leadingColor;
  final Color? titleColor;
  final Color? backgroundColor;
  final bool showNotificationAction;
  final Function()? onBack;

  @override
  Widget build(BuildContext context) {
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    Widget? leadingIcon = leading;

    if (leadingIcon == null) {
      if (hasDrawer) {
        leadingIcon = IconButton(
          icon: Icon(Icons.menu, color: leadingColor ?? Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      } else {
        if (canPop) {
          leadingIcon = IconButton(
            onPressed: () {
              if (onBack != null) {
                onBack?.call();
                return;
              }
              AppNavigator.pop();
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: AssetImages.icBack
                .toImage(height: 30, width: 30, color: leadingColor ?? AppColors.white),
          );
        }
      }
    }

    final List<Widget> actions = [
      ...(trailingActions ?? []),
      // if (showNotificationAction) _notificationIcon(),
    ];

    return AppBar(
      leading: leadingIcon,
      titleSpacing: leadingIcon != null ? 0 : 16,
      title: titleText != null
          ? Text(
              titleText!,
              style: TextStyles.whiteNormalSemiBold.copyWith(color: titleColor),
            )
          : title,
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
