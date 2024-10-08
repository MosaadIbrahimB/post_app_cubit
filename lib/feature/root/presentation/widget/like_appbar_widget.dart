import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_manager/app_color.dart';
import '../../../../core/utils/app_manager/app_style.dart';
import '../../control/root_cubit.dart';
class LikeAppBarWidget extends StatelessWidget {
  const LikeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, int>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 40.w, top: 65.h,right: 40.w),
          color: AppColor.blue,
          height: 186.h,
          width: double.infinity,
          //todoScreen or settingScreen  Title
          child: Text(
            state == 1 ?
            "settings".tr() :
            "todo".tr(),
            style: AppStyle.todo,
          ),
        );
      },
    );
  }
}
