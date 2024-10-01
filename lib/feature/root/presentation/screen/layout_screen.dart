import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/root/control/root_cubit.dart';
import 'package:task/feature/task/control/task_cubit.dart';

import '../widget/add_task_widget.dart';
import '../../../task/presention/widget/title_todo_and_date_widget.dart';
import '../widget/bottom_navbar_widget.dart';
import '../widget/floating_action_button.dart';

class LayoutScreen extends StatefulWidget {
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          //الخلفية والتاريخ
          const TitleTodoAndDateWidget(),
          //الشاشة
          BlocBuilder<RootCubit, int>(
            builder: (context, state) {
              return Expanded(child: RootCubit.screen[state]);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FABWidget(
        selectFun: () {
          addTask();
        },
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }

  changeDate(DateTime date) {
    context.read<TaskCubit>().fetchTask(selectedDate.millisecondsSinceEpoch);
  }

  void addTask() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const AddTaskWidget( );
      },
    );
  }
}

