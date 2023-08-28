import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetImages {
  static const String icHome = 'assets/ic_home.png';
  static const String icTarot = 'assets/ic_tarot.png';
  static const String icBack = 'assets/ic_back.png';
  static const String icQuestions = 'assets/ic_questions.png';
  static const String icHeart = 'assets/ic_heart.png';
  static const String icOneTarot = 'assets/ic_one_tarot.png';
  static const String icMoreTarot = 'assets/ic_more_tarot.png';
  static const String icTarotFun = 'assets/ic_tarot_fun.png';
  static const String icCrescentMoon = 'assets/ic_crescent_moon.png';
  static const String icTarotColor = 'assets/ic_tarot_color.png';
  static const String imgBackGround = 'assets/img_bg.jpg';
  static const String imgBackGroundDetail = 'assets/img_bg_detail.jpeg';
  static const String imgDefault = 'assets/img_default.png';
  static const String gifTarot = 'assets/tarot_gif.gif';

}

extension ConvertToImage on String {
  Widget toSvg({
    BuildContext? context,
    double width = 24,
    double? height,
    double padding = 0,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(
        this,
        width: width,
        height: height ?? width,
        color: color,
        cacheColorFilter: true,
        fit: fit,
      ),
    );
  }

  Widget toImage({
    BuildContext? context,
    double width = 24,
    double? height,
    double padding = 0,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Image.asset(
        this,
        color: color,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
