import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../setting/presention/screen/setting_screen.dart';
import '../../task/presention/screen/TaskScreen.dart';

class RootCubit extends Cubit<int>{
  RootCubit():super(0);
 static List<Widget> screen = [TaskScreen(),  SettingScreen()];


  changeScreen(int index){
    emit(index);
  }

}