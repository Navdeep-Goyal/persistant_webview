import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistant_webview/core/business_logic/cubit/progess_cubit_cubit.dart';
import 'package:persistant_webview/core/business_logic/cubit/url_string_cubit.dart';
import 'package:persistant_webview/core/enums/progess_enums.dart';
import 'package:persistant_webview/ui/view/screen_two.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/primary_outlined_button.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    late final PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();
    Uri uri = Uri.parse("https://cred.club/");
    NavigationDelegate navigationDelegate = NavigationDelegate(
      onProgress: (progress) {},
      onPageStarted: (url) {
        BlocProvider.of<ProgessCubit>(context)
            .onChangeProgess(ProgressEnum.loading);
      },
      onPageFinished: (url) {
        print(url);
        BlocProvider.of<ProgessCubit>(context)
            .onChangeProgess(ProgressEnum.loaded);
      },
      onWebResourceError: (error) {
        BlocProvider.of<ProgessCubit>(context)
            .onChangeProgess(ProgressEnum.initial);
      },
      onNavigationRequest: (request) {
        debugPrint(request.toString());
        log(request.toString());
        if (request.url.startsWith("http")) {
          BlocProvider.of<UrlStringCubit>(context).setUrl(request.url);
          return NavigationDecision.navigate;
        } else {
          launchUrl(Uri.parse(request.url));
          return NavigationDecision.prevent;
        }
      },
    );

    WebViewController controller =
        WebViewController.fromPlatformCreationParams(params)
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(navigationDelegate)
          ..loadRequest(uri);

    _webViewController = controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: PrimaryOutlinedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Screen2(
                      webViewController: _webViewController,
                    )));
          },
          label: "Button",
        ),
      ),
    );
  }
}
