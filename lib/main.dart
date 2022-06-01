import 'package:ebook/data/controllers/popular_book_controller.dart';
import 'package:ebook/data/repository/popular_book_repo.dart';
import 'package:ebook/pages/HomePage.dart';
import 'package:ebook/pages/detail_audio_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ebook/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  // Get.find<PopularBookRepo>().readData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularBookController>(builder: (_popularBookController) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}
