import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/feature/setting/presention/widget/radio_widget.dart';

import 'counter_show_model_widget.dart';

class ShowModelChoseLanguageWidget extends StatelessWidget {
  const ShowModelChoseLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterShowModelWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 15.h),
            Text("selectLanguage".tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black87)),
            RadioWidget(
              text: "english".tr(),
              value: 1,
            ),
            RadioWidget(
              text: "arabic".tr(),
              value: 2,
            ),
          ],
        ));
  }
}
