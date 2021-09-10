import 'package:flutter/material.dart';
import 'package:suites/constants/constants.dart';

class Borderbox extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? width, height;

  const Borderbox({Key? key, this.padding, this.width, this.height, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color_white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color_dark.withAlpha(40), width: 2),
      ),
      //spaces the child property evenly
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}
