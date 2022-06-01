import 'package:ebook/utils/app_colors.dart';
import 'package:ebook/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final int index;
  const SliderItem({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Dimensions.screenHeight * .2,
      margin: EdgeInsets.all(Dimensions.height10 * .5),
      decoration: BoxDecoration(
        color: (index.isEven) ? AppColors.menu2Color : AppColors.menu3Color,
        borderRadius: BorderRadius.circular(Dimensions.height10),
        image: DecorationImage(
          image: AssetImage("assets/images/${index + 1}.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
