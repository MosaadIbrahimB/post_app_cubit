import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task/feature/task/control/task_state.dart';
import 'package:task/feature/task/data/model/posat_model.dart';

import '../data/repositorie/task_repositry.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;

  TaskCubit({required this.taskRepository}) :super(TaskInitial());

  void fetchTask(int date){
    try {
      emit(TaskLoading());
      final tasksStream = taskRepository.getTasks(date);
      tasksStream.listen((tasks) {
        emit(TaskLoaded(tasks));
      }
      );
    } catch (e) {
      print(e);

      emit(const TaskError('fetchTask Failed to load tasks'));
    }
  }

  Future<void> addTask(TaskModel task) async {
    try {
      await taskRepository.addTask(task);
      // emit(const TaskActionSuccess("Task add success"));
       fetchTask(task.date);
    } catch (e) {
      emit(const TaskError("addTask faild to add task"));
    }
  }

  Future<void> updateTask(String id, TaskModel task) async {
    try {
      await taskRepository.updateTask(id, task);
       fetchTask(task.date);
    } catch (e) {
      emit(const TaskError("failed to update task"));
    }
  }

  deleteTask(String id,int date) async {
    try {
      await taskRepository.deleteTask(id);
      print('12355500');
      fetchTask(date);
    } catch (e) {
      print(e.toString());
      emit(const TaskError("faild to update task"));
    }
  }



}


class TaskModelCubit extends Cubit<TaskModel>{
  TaskModelCubit():super(TaskModel(title: "title", desc: "desc", date: DateTime.now().millisecondsSinceEpoch, status: false));

getTask(TaskModel task){
  emit(task);
}
}