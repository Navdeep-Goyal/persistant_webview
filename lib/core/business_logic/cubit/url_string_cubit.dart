
import 'package:flutter_bloc/flutter_bloc.dart';

class UrlStringCubit extends Cubit<String> {
  UrlStringCubit() : super("");

  setUrl(String value) {
    emit(value);
  }
}
