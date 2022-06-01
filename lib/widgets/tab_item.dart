import 'package:ebook/utils/app_colors.dart';
import 'package:ebook/utils/dimensions.dart';
import 'package:ebook/widgets/big_text.dart';
import 'package:ebook/widgets/small_text.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  const TabItem(
      {required this.text,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.blueAccent,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.height10 * 11,
      height: Dimensions.height10 * 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.height15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            offset: Offset(0, 0),
            color: Colors.grey.withOpacity(0.3),
          )
        ],
        color: backgroundColor,
      ),
      child: Center(child: BigText(text: text, color: Colors.white)),
    );
  }
}
