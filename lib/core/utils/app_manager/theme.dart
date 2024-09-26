import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_manager/app_color.dart';
import 'package:task/core/utils/app_manager/app_style.dart';

class AppTheme{


 static ThemeData light=ThemeData(
scaffoldBackgroundColor: AppColor.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.blue,
      toolbarHeight: 130.h,
      titleTextStyle: AppStyle.todo
    ),

    textTheme: TextTheme(
      headlineLarge: AppStyle.todo,
      headlineMedium: AppStyle.playBasketBall,
      headlineSmall: AppStyle.desc,
      titleMedium: AppStyle.language,
      titleSmall: AppStyle.supervised,
    )

  );




}