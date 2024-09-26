import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/feature/task/control/task_cubit.dart';
import '../../control/task_state.dart';
import '../widget/task_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BlocConsumer<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TaskLoaded) {
                  var list = state.tasks;
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 100.h, top: 5.h),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return TaskWidget(
                        list: list,
                        index: index,
                      );
                    },
                  );
                } else if (state is TaskError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return const Center(
                    child: Text("No task"),
                  );
                }
              },
              listener: (context, state) => const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
