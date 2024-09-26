import 'package:equatable/equatable.dart';

import '../data/model/posat_model.dart';


abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

// Loading state (e.g., when fetching tasks)
class TaskLoading extends TaskState {}

// Loaded state (when tasks are successfully fetched)
class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;
  const TaskLoaded(this.tasks);
  @override
  List<Object?> get props => [tasks];
}

// Success state for actions like adding, updating, or deleting tasks
class TaskActionSuccess extends TaskState {
  final String message;

  const TaskActionSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

// Error state for handling exceptions
class TaskError extends TaskState {
  final String errorMessage;

  const TaskError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}