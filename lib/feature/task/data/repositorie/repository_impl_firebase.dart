import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task/feature/task/data/model/posat_model.dart';
import 'package:task/feature/task/data/repositorie/task_repositry.dart';

class RepositoryImplFirebase extends TaskRepository {
  CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection('task')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  @override
  Stream<List<TaskModel>> getTasks(int date) {
    var collection = getTaskCollection().where('date', isEqualTo: date);
  return  collection.snapshots().map((event) => event.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> addTask(TaskModel task) {
    var collection = getTaskCollection();
    var doc = collection.doc();
    task.id = doc.id;
    print(task.date);

    return doc.set(task);
  }

  @override
  Future<void> deleteTask(String id) {
    var collection = getTaskCollection();
    var doc = collection.doc(id);
    return doc.delete();
  }

  @override
  Future<void> updateTask(String id, TaskModel task) {
    var collection = getTaskCollection();
    var doc = collection.doc(id);
    task.id = id;
    return doc.update(task.toJson());
  }

  @override
  Stream<TaskModel> getOneTask(String id) {
    final controller = StreamController<TaskModel>();
    var lock = Object();
    // استماع للتغييرات في المستند من Firebase
    FirebaseFirestore.instance.collection('task').doc(id).snapshots().listen(
          (snapshot) {
          Map<String,dynamic>?map=  snapshot.data();
          print(map?["title"]??"kjkjkj");
        if (snapshot.exists) {
          var task = TaskModel.fromJson(map!);
          // print(task.status);

          // استخدام lock للتأكد من التعامل الصحيح مع البيانات في حالة التوازي
          synchronized(lock, () {
            controller.add(task); // إرسال المهمة إلى الـ Stream
          });
        } else {
          controller.addError('Task not found');
        }
      },
      onError: (error) {
        controller.addError('Error retrieving task: $error');
      },
    );

    return controller.stream;
  }

// دالة synchronized للتأكد من أن المهام تتم بالتزامن
  void synchronized(Object lock, void Function() action) {
    if (lock is! bool) {
      lock = true;
    }
    try {
      action();
    } finally {
      lock = false;
    }
  }




}
