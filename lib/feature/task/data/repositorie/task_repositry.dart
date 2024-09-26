import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/posat_model.dart';

abstract class TaskRepository {
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(String id, TaskModel task);
  Future<void> deleteTask(String id);
  Stream<List<TaskModel>> getTasks(int date);

  Stream<TaskModel> getOneTask(String id);

}
