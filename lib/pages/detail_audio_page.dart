import 'package:audioplayers/audioplayers.dart';
import 'package:ebook/data/controllers/popular_book_controller.dart';
import 'package:ebook/models/book_model.dart';
import 'package:ebook/pages/audio_file.dart';
import 'package:ebook/utils/app_colors.dart';
import 'package:ebook/utils/dimensions.dart';
import 'package:ebook/widgets/big_text.dart';
import 'package:ebook/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailAudioPage extends StatefulWidget {
  final BookModel book;

  const DetailAudioPage({required this.book, Key? key}) : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState(book: book);
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  BookModel book;
  _DetailAudioPageState({required this.book, Key? key});
  late AudioPlayer advancedPlayer;
  @override
  void initState() {
    super.initState();
    advancedPlayer = Get.find<PopularBookController>().audioPlayer;
  }

  @override
  Widget build(BuildContext context) {
    String path = book.audio!;
    return Scaffold(
      body: Stack(children: [
        //header
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: Dimensions.screenHeight * .4,
            child: Container(
              color: Colors.blue,
            )),
        // app bar
        Positioned(
            top: Dimensions.height5,
            left: Dimensions.height5,
            right: Dimensions.height5,
            // height: Dimensions.height10 * 5,
            child: AppBar(
              leading: GestureDetector(
                  onTap: () {
                    // advancedPlayer.stop();
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.white)),
              actions: [Icon(Icons.search, color: Colors.white)],
              elevation: 0.0,
            )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: Dimensions.screenHeight * .6,
            child: Container(color: AppColors.audioBluishBackground)),

        // audio continer
        Positioned(
            top: Dimensions.height10 * 15,
            left: 0,
            right: 0,
            height: Dimensions.screenHeight * .4,
            // height: Dimensions.height10 * 5,
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height10 * 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.height45)),
              child: Column(children: [
                BigText(
                  text: book.title!,
                  size: Dimensions.font20 * 1.7,
                ),
                SmallText(
                  text: book.text!,
                  size: Dimensions.font16 * 1.2,
                ),
                AudioFile(
                  advancedPlayer: advancedPlayer,
                  audioPath: path,
                ),
              ]),
            )),
        // audio photo
        Positioned(
          top: Dimensions.height10 * 7.5,
          left: (Dimensions.screenWidth - 150) / 2,
          right: (Dimensions.screenWidth - 150) / 2,
          height: Dimensions.height10 * 15,

          // height: Dimensions.height10 * 5,
          child: Container(
            padding: EdgeInsets.all(Dimensions.height10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(Dimensions.height15)),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(book.img!), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
