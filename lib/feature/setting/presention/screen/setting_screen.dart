import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/lang_widget.dart';
import '../widget/show_model_chose_language_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              showModelFun(context);
            },
            child: const LangWidget(),
          ),
          SizedBox(height: 25.h),
          // LangWidget(),
        ],
      ),
    );
  }

  showModelFun(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const ShowModelChoseLanguageWidget());
  }
}




