import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_manager/app_color.dart';

class CounterShowModelWidget extends StatelessWidget {
  Widget? child;

  CounterShowModelWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          topLeft: Radius.circular(25.r),
        ),
      ),
      child: child,
    );
  }
}
