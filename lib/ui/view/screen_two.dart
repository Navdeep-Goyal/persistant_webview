import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/colors.dart';
import '../widgets/web_view_app_bar.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key, required this.webViewController});
  final WebViewController webViewController;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool canGoBack = await widget.webViewController.canGoBack();
        if (canGoBack) {
          widget.webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: kWhiteColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              webViewController: widget.webViewController,
            ),
            body: WebViewWidget(
              controller: widget.webViewController,
            ),
          ),
        ),
      ),
    );
  }
}
