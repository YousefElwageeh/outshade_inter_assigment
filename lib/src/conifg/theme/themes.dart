// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:outshade_inter_assigment/src/conifg/theme/colorManger.dart';

import 'package:outshade_inter_assigment/src/conifg/theme/hexcolor.dart';

import 'package:outshade_inter_assigment/src/conifg/theme/valuseManger.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(color: HexColor("#F0F3F8")),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      iconTheme: const IconThemeData(color: Color(0xff2b2b2b)),
      primaryColor: ColorManager.primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
      backgroundColor: Colors.white,
      errorColor: Colors.red,
      //   buttonColor: Color(primaryColor),

      platform: TargetPlatform.iOS,
      shadowColor: Colors.black,
      indicatorColor: ColorManager.primaryColor,
      disabledColor: Colors.black.withOpacity(0.1),
      elevatedButtonTheme: const ElevatedButtonThemeData(),

      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorManager.textFormFiledColor,

          // enabled border style
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.textFormFiledColor, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s18)),

          // focused border style
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.primaryColor, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s18)),

          // error border style
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.error, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s18)),
          // focused border style
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.primaryColor, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s18))),
      // label style
    );
  }
}
