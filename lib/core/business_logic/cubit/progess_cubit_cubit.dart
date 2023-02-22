import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistant_webview/core/enums/progess_enums.dart';



/// Cubit to show progess indicator on web view page
class ProgessCubit extends Cubit<ProgressEnum> {
  ProgessCubit() : super(ProgressEnum.initial);

  onChangeProgess(ProgressEnum progressEnum) {
    emit(progressEnum);
  }
}
