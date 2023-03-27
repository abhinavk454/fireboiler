import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  final Function handleClick;
  final String text;
  final double height;
  final double width;
  final Color bgColor;
  const ButtonOne({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.bgColor,
    required this.handleClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        handleClick();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: bgColor,
        ),
        width: width,
        height: height,
        child: Text(
          text,
        ),
      ),
    );
  }
}
