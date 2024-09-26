import 'package:flutter/material.dart';

import '../../../../core/utils/app_manager/app_color.dart';

class DoneWidget extends StatelessWidget {
  const DoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 10),
      child: const Text(
        "Done",
        style: TextStyle(
            color: AppColor.green, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
