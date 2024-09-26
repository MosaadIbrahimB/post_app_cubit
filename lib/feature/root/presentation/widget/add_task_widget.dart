import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/feature/task/presention/widget/text_date_picker_widget.dart';
import 'package:task/feature/task/presention/widget/text_form_field_widget.dart';
import 'package:task/feature/task/presention/widget/text_title_add_new_task_widget.dart';

import '../../../task/control/date_time_cubit.dart';
import '../../../task/control/task_cubit.dart';
import '../../../task/data/model/posat_model.dart';
import '../../../task/presention/widget/circle_btn_widget.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({
    super.key, this.isEdit=false,
  });
  final bool ?isEdit;

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  var keyForm = GlobalKey<FormState>();

 late TextEditingController titleEditingController;
  late TextEditingController descEditingController ;
@override
  void initState() {
  titleEditingController = TextEditingController( text: context.read<TaskModelCubit>().state.title=="title"?null:context.read<TaskModelCubit>().state.title);
  descEditingController = TextEditingController( text: context.read<TaskModelCubit>().state.desc=="desc"?null:context.read<TaskModelCubit>().state.desc);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        // height: 330.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(1.r), topLeft: Radius.circular(1.r))),
        child: Form(
            key: keyForm,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8).r,
              child: ListView(
                shrinkWrap: true,
                children: [
                   TextTitleAddNewTaskWidget(isEdite: widget.isEdit,),
                  SizedBox(
                    height: 20.h,
                  ),
                  TFFieldWidget(
                    title: "Enter title ",
                    textEditingController: titleEditingController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TFFieldWidget(
                    title: "Enter description ",
                    textEditingController: descEditingController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () async {
                     await showDatePickerFun();
                    },
                    child: const TextDatePickerWidget(),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () {
                      if (keyForm.currentState!.validate()) {
                         addTask();
                      }
                    },
                    child: const CircleBtnWidget(),
                  )
                ],
              ),
            )),
      ),
    );
  }

  addTask() {
    TaskModel task = TaskModel(
        title: titleEditingController.text,
        desc: descEditingController.text,
        date: context.read<DateTimeCubit>().state.millisecondsSinceEpoch,
        status: false);
    var id=context.read<TaskModelCubit>().state.id;
    widget.isEdit==true? context.read<TaskCubit>().updateTask(id,task):
    context.read<TaskCubit>().addTask(task);
    Navigator.pop(context);
  }

  showDatePickerFun() async {
    DateTime? dateTimePicker = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 5),
      ),
    );
    if (!mounted) return;
    if (dateTimePicker != null) {
  context.read<DateTimeCubit>().changeDate(dateTimePicker);
    }
  }
}




