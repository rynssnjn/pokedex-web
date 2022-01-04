import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    this.size = 50.0,
    this.strokeWidth = 2.0,
    this.valueColor = Colors.blueAccent,
    this.backgroundColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  final double size;
  final double strokeWidth;
  final Color valueColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
