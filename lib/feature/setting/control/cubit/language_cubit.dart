import 'package:bloc/bloc.dart';
import 'package:task/core/utils/app_manager/app_text.dart';

class LanguageCubit extends Cubit<String>{
  LanguageCubit():super(AppText.english);



 changeLanguage(String newLang){
   emit(newLang);
 }

}

