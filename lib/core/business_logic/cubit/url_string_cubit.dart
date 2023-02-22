
import 'package:flutter_bloc/flutter_bloc.dart';



/// Cubit to update url of current state of any web view
class UrlStringCubit extends Cubit<String> {
  UrlStringCubit() : super("");

  setUrl(String value) {
    emit(value);
  }
}
