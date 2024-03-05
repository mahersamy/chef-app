import 'package:bloc/bloc.dart';
import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:meta/meta.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  bool isArabic=false;
  String langCode="en";
  CacheHelper cacheHelper=CacheHelper();

  void switchLang(String code)async{
    langCode=code;
    await getIt<CacheHelper>().cacheLanguage(code);
    emit(ChangeLang());
  }





  void getLangInCache(){
    langCode=getIt<CacheHelper>().getCachedLanguage();
  }
}
