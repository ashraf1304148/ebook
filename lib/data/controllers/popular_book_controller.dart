import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:ebook/data/repository/popular_book_repo.dart';
import 'package:ebook/models/book_model.dart';
import 'package:ebook/pages/audio_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularBookController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final PopularBookRepo popularBookRepo;
  late BookModel _currentBook;
  PopularBookController({required this.popularBookRepo});
  void setFavorite(String id) => popularBookRepo.updateFavorite(id);
  void setBook(BookModel newBook) {
    _currentBook = newBook;
  }

  bool getFavorite(String id) => popularBookRepo.isFavorite(id);
  List<BookModel> _popularBooksList = [];

  void operNewBook(BookModel book) {
    _currentBook = book;
    // audioPlayer.stop();
    audioPlayer.setUrl(_currentBook.audio!);
    audioPlayer.play(_currentBook.audio!);
  }

  void get pause => audioPlayer.pause();
//  void get speed=>
}
