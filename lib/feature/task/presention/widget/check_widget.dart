import 'package:flutter/material.dart';

import '../../../../core/utils/app_manager/app_color.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColor.blue, borderRadius: BorderRadius.circular(6)),
      child: const Icon(
        Icons.check_outlined,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
