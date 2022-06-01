import 'dart:convert';

import 'package:ebook/models/book_model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopularBookRepo {
  final SharedPreferences sharedPreferences;
  PopularBookRepo({required this.sharedPreferences});
  List<BookModel> _popularBooksList = [];
  bool isLoaded = false;
  void updateFavorite(String id) {
    if (sharedPreferences.containsKey(id)) {
      sharedPreferences.setBool(id, !sharedPreferences.getBool(id)!);
    } else {
      sharedPreferences.setBool(id, true);
    }
  }

  bool isFavorite(String id) {
    if (sharedPreferences.containsKey(id)) {
      return sharedPreferences.getBool(id)!;
    } else
      return false;
  }
/*
  readDatas() async {
    
      await rootBundle.loadString("json/popularBooks.json").then((s) {
        json.decode(s).forEach(
            (value) => _popularBooksList.add(BookModel.fromJson(value)));
       
     
      });
    }*/
  }

