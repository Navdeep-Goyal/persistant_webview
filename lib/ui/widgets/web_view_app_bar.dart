import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistant_webview/core/enums/progess_enums.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/business_logic/cubit/progess_cubit_cubit.dart';
import '../../core/business_logic/cubit/url_string_cubit.dart';
import '../../utils/colors.dart';
import 'custom_circular_progress_indicator.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final WebViewController webViewController;

  const CustomAppBar({
    super.key,
    this.height = kToolbarHeight,
    required this.webViewController,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: kWhiteColor,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                bool canGoBack = await webViewController.canGoBack();
                canGoBack
                    ? webViewController.goBack()
                    : Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                webViewController.goForward();
              },
              icon: const Icon(Icons.arrow_forward)),
          BlocBuilder<UrlStringCubit, String>(
            builder: (context, state) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.5),
                child: Text(
                  state,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          BlocBuilder<ProgessCubit, ProgressEnum>(
            builder: (context, state) {
              if (state == ProgressEnum.loading) {
                return const CustomCircularProgressIndicator();
              }
              return IconButton(
                  onPressed: () {
                    webViewController.reload();
                  },
                  icon: const Icon(Icons.replay_outlined));
            },
          )
        ],
      ),
    );
  }
}


