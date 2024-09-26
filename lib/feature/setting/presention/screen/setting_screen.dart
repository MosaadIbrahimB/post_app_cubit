import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_manager/app_color.dart';
import 'package:task/core/utils/app_manager/app_text.dart';
import 'package:task/feature/root/presentation/screen/layout_screen.dart';
import 'package:task/feature/setting/control/cubit/language_cubit.dart';

import '../widget/lang_widget.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  // المتغير الذي يحتفظ بالقيمة المختارة


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
      builder: (context) => ShowModelChoseLanguageWidget()
    );
  }
}

class ShowModelChoseLanguageWidget extends StatelessWidget {
   ShowModelChoseLanguageWidget({super.key});
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.r),
              topLeft: Radius.circular(25.r))),
      child: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 15.h),
                Text("Select Language",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.black87)),
                ListTile(
                  title: Text(
                    AppText.english,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  leading: Radio(
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(AppText.arabic,
                      style: Theme.of(context).textTheme.titleMedium),
                  leading: Radio(
                    value: 2,
                    groupValue: selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        selectedValue = value!;

                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("cancel",
                            style:
                            Theme.of(context).textTheme.headlineMedium)),
                    OutlinedButton(
                        onPressed: () {
                          String lang = "";
                          if (selectedValue == 1) {
                            lang = AppText.english;
                          } else {
                            lang = AppText.arabic;
                          }
                          context.read<LanguageCubit>().changeLanguage(lang);
                          print(context.read<LanguageCubit>().state);

                          Navigator.pop(context);
                        },
                        child: Text(
                          "save",
                          style: Theme.of(context).textTheme.headlineMedium,
                        )),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
