import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color/color_constants.dart';

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorConstants.instance.white,
    fontFamily: "Poppins",

    // FAB
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: const StadiumBorder(),
      backgroundColor: ColorConstants.instance.white,
    ),

    // APPBAR
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: ColorConstants.instance.white,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent),

    // TEXT
    textTheme: TextTheme(
        headline5: TextStyle(
            //default title
            color: ColorConstants.instance.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold),
        headline1: TextStyle(
            color: ColorConstants.instance.shadyNeonBlue,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: ColorConstants.instance.white, fontWeight: FontWeight.bold),
        headline6:
            TextStyle(color: ColorConstants.instance.white, fontSize: 16.sp),
        bodyText1: TextStyle(
            color: ColorConstants.instance.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold),
        bodyText2: TextStyle(
            color: ColorConstants.instance.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold),
        subtitle2: TextStyle(
            // default subtitle
            color: ColorConstants.instance.darkGrey,
            fontSize: 12.sp)),

    // INPUT DECORATION
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorConstants.instance.white),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorConstants.instance.white),
      ),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      alignLabelWithHint: true,
      labelStyle:
          TextStyle(color: ColorConstants.instance.darkGrey, fontSize: 16.sp),
      hintStyle: TextStyle(
          color: ColorConstants.instance.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold),
    ),

    // ICON
    iconTheme: IconThemeData(color: ColorConstants.instance.white),

    // BOTTOM APPBAR
    bottomAppBarTheme: BottomAppBarTheme(
      shape: const CircularNotchedRectangle(),
      color: ColorConstants.instance.shadyNeonBlue,
    ),

    // BUTTON
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorConstants.instance.metroidRed,
        disabledForegroundColor:
            ColorConstants.instance.metroidRed.withOpacity(0.38),
        disabledBackgroundColor:
            ColorConstants.instance.metroidRed.withOpacity(0.12),

        elevation: 10,
        // onSurface: ColorConstants.instance.metroidRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),

    // TABBAR
    tabBarTheme: TabBarTheme(
        mouseCursor: MaterialStateMouseCursor.clickable,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
            fontSize: 16.sp,
            color: ColorConstants.instance.white,
            fontWeight: FontWeight.w900),
        unselectedLabelStyle: TextStyle(
            color: ColorConstants.instance.metroidRed,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
        indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
          color: Colors.transparent,
        ))));
