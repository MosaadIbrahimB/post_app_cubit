import 'package:get_it/get_it.dart';
import 'package:task/feature/task/control/date_time_cubit.dart';
import 'package:task/feature/task/control/task_cubit.dart';
import 'package:task/feature/task/data/repositorie/task_repositry.dart';

import '../../../feature/root/control/root_cubit.dart';
import '../../../feature/setting/control/cubit/language_cubit.dart';
import '../../../feature/task/data/repositorie/repository_impl_firebase.dart';

final getIt = GetIt.instance;

void setUp(){
  getIt.registerLazySingleton<TaskRepository>(() =>RepositoryImplFirebase() ,);
  getIt.registerFactory<TaskCubit>(() => TaskCubit(taskRepository: getIt<TaskRepository>()),);
  getIt.registerSingleton<DateTimeCubit>(DateTimeCubit(),);
  getIt.registerLazySingleton<RootCubit>(() => RootCubit(),);
  getIt.registerLazySingleton<TaskModelCubit>(() => TaskModelCubit());
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
}