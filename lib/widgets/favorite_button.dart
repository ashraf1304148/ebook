import 'package:ebook/data/controllers/popular_book_controller.dart';
import 'package:ebook/utils/dimensions.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class FavoriteButton extends StatelessWidget {
  final Color disabledColor;
  String id;
  FavoriteButton(
      {this.disabledColor = Colors.white, required this.id, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isFavorite = false;
    return GetBuilder<PopularBookController>(builder: (_bookController) {
      return GestureDetector(
        onTap: (() {
          _bookController.setFavorite(id );
          _bookController.update();
        }),
        child: Container(
          height: Dimensions.height10 * 5,
          width: Dimensions.height10 * 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height10),
            color: Colors.white24,
          ),
          child: Icon(
            Icons.favorite,
            color: (_bookController.getFavorite(id))
                ? Colors.red
                : disabledColor,
          ),
        ),
      );
    });
  }
}
