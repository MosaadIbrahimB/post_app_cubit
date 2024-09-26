import 'package:flutter/material.dart';

import '../../../../core/utils/app_manager/app_color.dart';
class TextTitleAddNewTaskWidget extends StatelessWidget {
  const TextTitleAddNewTaskWidget({
    super.key, this.isEdite=false,
  });
final bool ?isEdite;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      isEdite==true? "Edite Task":"Add new Task",
      style: Theme
          .of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: AppColor.black70),
    );
  }
}
