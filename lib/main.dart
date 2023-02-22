import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistant_webview/core/business_logic/cubit/progess_cubit_cubit.dart';
import 'package:persistant_webview/ui/view/screen_one.dart';
import 'package:persistant_webview/utils/colors.dart';
import 'package:persistant_webview/utils/text_contants.dart';

import 'core/business_logic/cubit/url_string_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProgessCubit()),
        BlocProvider(create: (_) => UrlStringCubit()),
      ],
      child: MaterialApp(
        title: TextContants.title,
        theme: ThemeData(primaryColor: kPrimaryColor),
        home: const Screen1(),
      ),
    );
  }
}
