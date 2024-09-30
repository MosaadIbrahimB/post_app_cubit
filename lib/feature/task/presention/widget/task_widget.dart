import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/feature/task/control/task_cubit.dart';
import 'package:task/feature/task/presention/widget/slidable_widget.dart';

import '../../../../core/utils/app_manager/app_color.dart';
import '../../../root/presentation/widget/add_task_widget.dart';
import '../../data/model/posat_model.dart';
import 'check_widget.dart';
import 'done_widget.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.list,
    required this.index,
  });

  final int index;

  final List<TaskModel> list;

  @override
  Widget build(BuildContext context) {
    return SlidableWidget(
      deleteFunction: deleteTaskFun,
      editFunction: editTaskFun,
      child: Card(
        color: AppColor.white,
        elevation: 5,
        child: SizedBox(
          width: 400.w,
          height: 120.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VerticalContainerWidget(color: list[index].status ? AppColor.green : AppColor.blue,),
              SizedBox(
                width: 277.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextTileAndDescWidget(
                      text: list[index].title,
                      status: list[index].status,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    TextTileAndDescWidget(
                      text: list[index].desc,
                      status: list[index].status,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              //container stats
              InkWell(
                  onTap: () {
                    list[index].status = !list[index].status;
                    context
                        .read<TaskCubit>()
                        .updateTask(list[index].id, list[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 15,left: 8).r,
                    width: 68.w,
                    height: 33.h,
                    child: list[index].status
                        ? const DoneWidget()
                        : const CheckWidget(),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void deleteTaskFun(BuildContext context) {
    context.read<TaskCubit>().deleteTask(list[index].id,list[index].date);
  }

  void editTaskFun(BuildContext context) {
    context.read<TaskModelCubit>().getTask(list[index]);
    editTask(context);
  }



  void editTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const AddTaskWidget( isEdit: true);
      },
    );
  }
}

class VerticalContainerWidget extends StatelessWidget {
  const VerticalContainerWidget({
    super.key, required this.color,

  });

 final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      width: 4.w,
      decoration: BoxDecoration(
        color:color,

          borderRadius: BorderRadius.circular(10).r),
      margin: const EdgeInsets.only(
              top: 8, bottom: 8, left: 10, right: 10)
          .r,
    );
  }
}

class TextTileAndDescWidget extends StatelessWidget {
  const TextTileAndDescWidget({
    super.key,
    required this.style,
    required this.text,
    required this.status,
  });

  final TextStyle? style;
  final String text;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      overflow: TextOverflow.clip,
      softWrap: true,
      text,
      style: status ? style!.copyWith(color: AppColor.green) : style,
    );
  }
}

