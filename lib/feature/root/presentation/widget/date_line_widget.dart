import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_manager/app_color.dart';
import '../../../task/control/date_time_cubit.dart';
import '../../../task/control/task_cubit.dart';
class DateLineWidget extends StatelessWidget {
  const DateLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateTimeCubit, DateTime>(
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
                  context
                      .read<TaskCubit>()
                      .fetchTask(date.millisecondsSinceEpoch);
                  print("llllllllllllllllllllllllllll$state");
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
