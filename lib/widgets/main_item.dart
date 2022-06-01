import 'package:ebook/data/controllers/popular_book_controller.dart';
import 'package:ebook/models/book_model.dart';
import 'package:ebook/pages/detail_audio_page.dart';
import 'package:ebook/utils/app_colors.dart';
import 'package:ebook/utils/dimensions.dart';
import 'package:ebook/widgets/big_text.dart';
import 'package:ebook/widgets/favorite_button.dart';
import 'package:ebook/widgets/small_text.dart';
import 'package:ebook/widgets/stars_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainItem extends StatelessWidget {
  final Color backgroundColor;
  final BookModel book;
  const MainItem(
      {required this.book,
      this.backgroundColor = const Color(0xfffefefe),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight * .14,
      width: Dimensions.screenWidth,
      margin: EdgeInsets.only(
        left: Dimensions.height20,
        right: Dimensions.height20,
        top: Dimensions.height10,
        bottom: Dimensions.height10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.height20),
      ),
      child: Row(children: [
        //imag
        GestureDetector(
          onTap: () {
            Get.find<PopularBookController>().operNewBook(book);
            Get.to(DetailAudioPage(book: book));
          },
          child: Container(
            width: Dimensions.screenWidth * .28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height10),
              image: DecorationImage(
                image: AssetImage(book.img!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.height15,
            // right: Dimensions.height10,
            top: Dimensions.height20,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: getTitle(book.title!),
                size: Dimensions.font20 * .8,
                overflow: TextOverflow.ellipsis,
              ),
              SmallText(text: book.text!),
              Container(
                width: Dimensions.screenWidth * .55,
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StartsWidget(
                      starsCount: double.parse(book.rating!),
                    ),
                    FavoriteButton(
                      id: book.id!,
                      disabledColor: backgroundColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  String getTitle(String t) {
    String s = "";
    List<String> words = t.split(" ");

    int lineSize = 20, maxLines = 3;
    for (int i = 0; i < maxLines; i++) {
      words.forEach((element) {
        if (element.length < lineSize) {
          s += element + " ";
          lineSize -= (element.length + 1);
        } else {
          lineSize = 20;
          s += "\n";
        }
      });
    }

    return s;
  }
}
