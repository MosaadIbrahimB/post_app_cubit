import 'package:flutter/material.dart';

import '../../../../core/utils/app_manager/app_color.dart';
class CircleBtnWidget extends StatelessWidget {
  const CircleBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.blue,
          border:
          Border.all(color: AppColor.gray, width: 4)),
      child: const Icon(
        Icons.check, color: AppColor.white, size: 40 ,),
    );
  }
}
