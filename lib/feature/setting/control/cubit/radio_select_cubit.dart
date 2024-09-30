import 'package:bloc/bloc.dart';

class RadioSelectCubit extends Cubit<int>{
  RadioSelectCubit():super(1);


  changeSelect(newSelect){
    emit(newSelect);
  }



}