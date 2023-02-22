import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(right: 10),
      child: const CircularProgressIndicator(
        color: kPrimaryColor,
        strokeWidth: 2,
      ),
    );
  }
}