import 'package:ebook/data/controllers/popular_book_controller.dart';
import 'package:ebook/data/repository/popular_book_repo.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  // print("hello init()");
  final sharedPreferences = await SharedPreferences.getInstance();

  // sharedPreferences
  Get.lazyPut(() => sharedPreferences);

  // repositories

  Get.lazyPut(() => PopularBookRepo(sharedPreferences: Get.find()));

// controllers

  Get.lazyPut(() => PopularBookController(popularBookRepo: Get.find()));
}
