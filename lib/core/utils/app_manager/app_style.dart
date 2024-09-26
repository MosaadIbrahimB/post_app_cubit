import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_manager/app_color.dart';

class AppStyle {
  static TextStyle todo = TextStyle(
    fontSize: 22.sp,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
  static TextStyle playBasketBall = TextStyle(
      fontSize: 18.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      color: AppColor.blue);
  static TextStyle desc = TextStyle(
      fontSize: 12.sp, fontFamily: "Poppins", fontWeight: FontWeight.w400);
  static TextStyle supervised = TextStyle(
    fontSize: 14.sp,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    color: AppColor.blue
  );

  static TextStyle language = TextStyle(
      fontSize: 14.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
  );
}
