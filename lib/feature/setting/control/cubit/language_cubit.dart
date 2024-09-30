import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageCubit extends Cubit<String>{
  LanguageCubit():super("english".tr());



 changeLanguage(String newLang){
   emit(newLang);
 }

}

