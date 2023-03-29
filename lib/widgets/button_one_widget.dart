import 'package:fireboiler/utils/constant_utils.dart';
import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  final Function handleClick;
  final String text;
  final double height;
  final double width;
  final Color bgColor;
  final String? iconUrl;

  const ButtonOne({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.bgColor,
    required this.handleClick,
    this.iconUrl,
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
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          border: Border.all(
            color: colorFour,
            width: 1,
          ),
          color: bgColor,
        ),
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconUrl != null)
              SizedBox(
                height: 30,
                width: 30,
                child: Image.network(iconUrl ?? ''),
              ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
