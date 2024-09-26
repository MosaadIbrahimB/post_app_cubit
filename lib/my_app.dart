import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/router/router.dart';
import 'core/utils/app_manager/theme.dart';
import 'feature/root/control/root_cubit.dart';
import 'feature/setting/control/cubit/language_cubit.dart';
import 'feature/task/control/date_time_cubit.dart';
import 'feature/task/control/task_cubit.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(
          providers:cubitList,
          child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppTheme.light,
              routerConfig: AppRouter.router,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale
          ),
        );
      },
    );
  }
}
var cubitList=[
  BlocProvider<TaskCubit>(
    create: (context) => GetIt.I<TaskCubit>()..fetchTask(DateUtils.dateOnly(DateTime.now()).millisecondsSinceEpoch),
  ),
  BlocProvider<DateTimeCubit>(
      create: (context) => GetIt.I<DateTimeCubit>()),
  BlocProvider<RootCubit>(
      create: (context) => GetIt.I<RootCubit>()),
  BlocProvider<TaskModelCubit>(
      create: (context) => GetIt.I<TaskModelCubit>()),
  BlocProvider<LanguageCubit>(
      create: (context) => GetIt.I<LanguageCubit>()),

];