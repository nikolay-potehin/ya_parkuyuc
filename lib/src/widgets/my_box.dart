import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(229, 230, 234, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
