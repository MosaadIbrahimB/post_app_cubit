import 'package:bloc/bloc.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class DateTimeCubit extends Cubit<DateTime>{
  DateTimeCubit():super(DateUtils.dateOnly(DateTime.now()));
 static DatePickerController? controller = DatePickerController();

  changeDate(DateTime  newDate){
    emit(DateUtils.dateOnly(newDate));
    controller?.setDateAndAnimate(newDate);
    print("zzzzzzzzzzzzzzzzzzzzzz $state");
      }


}