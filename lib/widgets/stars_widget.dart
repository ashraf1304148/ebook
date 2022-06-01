import 'package:ebook/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class StartsWidget extends StatelessWidget {
  final double starsCount;

  const StartsWidget({this.starsCount = 4.2, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: starsCount,
      starBuilder: (index, color) => Icon(
        Icons.star,
        color: color,
      ),
      starCount: 5,
      starSize: Dimensions.height20,
      valueLabelColor: const Color(0xff9b9b9b),
      valueLabelTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: Dimensions.height10 * 1.2),
      valueLabelRadius: Dimensions.height10,
      maxValue: 5,
      starSpacing: 2,
      maxValueVisibility: true,
      valueLabelVisibility: true,
      animationDuration: Duration(milliseconds: 2000),
      valueLabelPadding: EdgeInsets.symmetric(
          vertical: Dimensions.height10 * .7,
          horizontal: Dimensions.height10 * .4),
      valueLabelMargin: EdgeInsets.only(
          top: Dimensions.height10 * 1.2, right: Dimensions.height10 * .3),
      starOffColor: const Color(0xffe7e8ea),
      starColor: Colors.yellow,
    );
  }
}
