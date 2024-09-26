import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/feature/root/control/root_cubit.dart';
import 'package:task/feature/root/presentation/screen/layout_screen.dart';
import 'package:task/feature/task/control/date_time_cubit.dart';
import 'package:task/feature/task/control/task_cubit.dart';

import '../../../../core/utils/app_manager/app_color.dart';
import '../../../../core/utils/app_manager/app_style.dart';
import '../../../../core/utils/app_manager/app_text.dart';

class TitleTodoAndDateWidget extends StatefulWidget {
  const TitleTodoAndDateWidget({super.key});

  @override
  State<TitleTodoAndDateWidget> createState() => _TitleTodoAndDateWidgetState();
}

class _TitleTodoAndDateWidgetState extends State<TitleTodoAndDateWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, int>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40.w, top: 65.h),
              color: AppColor.blue,
              height: 186.h,
              width: double.infinity,
              //todoScreen or settingScreen  Title
              child: Text(
                state == 1 ? AppText.setting : AppText.todo,
                style: AppStyle.todo,
              ),
            ),
            state == 1
            //اللى هى شاشة الاعدادات
                ? const SizedBox()
            //اللى هى شاشة التاسك
                : BlocBuilder<DateTimeCubit, DateTime>(
              builder: (context, state) {
                return Column(
                  children: [
                    //عملت النص  ده عشان اشوف قيمة state date
                    // Text("Time ${state.toString().substring(0)}",style: const TextStyle(fontSize: 20),),
                    Container(
                      padding: EdgeInsets.only(left: 5.w, top: 130.h),
                      //الايام بالعرض
                      child: DatePicker(
                        controller: DateTimeCubit.controller,
                        height: 100,
                        DateTime.now(),
                        initialSelectedDate: state,
                        selectionColor: AppColor.white,
                        selectedTextColor: AppColor.blue,
                        onDateChange: (date) {
                          context.read<DateTimeCubit>().changeDate(date);
                          context.read<TaskCubit>().fetchTask( date.millisecondsSinceEpoch);
                          print("llllllllllllllllllllllllllll$state");
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
