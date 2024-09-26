import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_manager/app_text.dart';
import 'package:task/feature/root/presentation/screen/layout_screen.dart';
import 'package:task/feature/setting/control/cubit/language_cubit.dart';
import '../../../../core/utils/app_manager/app_color.dart';

class LangWidget extends StatelessWidget {
  const LangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.language,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 15.h),
        Container(
          margin: const EdgeInsets.only(left: 18).r,
          padding: const EdgeInsets.symmetric(horizontal: 10).r,
          decoration: BoxDecoration(
              color: AppColor.white, border: Border.all(color: AppColor.blue)),
          width: 330.w,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<LanguageCubit, String>(
                builder: (context, state) {
                  return Text(
                    state,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.blue),
                  );
                },
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 35,
                color: AppColor.blue,
              )
            ],
          ),
        )
      ],
    );
  }
}
