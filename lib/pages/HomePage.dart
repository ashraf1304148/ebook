import 'dart:convert';

import 'package:ebook/data/controllers/popular_book_controller.dart';
import 'package:ebook/data/repository/popular_book_repo.dart';
import 'package:ebook/models/book_model.dart';
import 'package:ebook/utils/app_colors.dart';
import 'package:ebook/utils/dimensions.dart';
import 'package:ebook/widgets/big_text.dart';
import 'package:ebook/widgets/main_item.dart';
import 'package:ebook/widgets/nav_bar.dart';
import 'package:ebook/widgets/slider_item.dart';
import 'package:ebook/widgets/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List popularBooks = [];
  late ScrollController _scrollController;
  late TabController _tabController;
  List<BookModel> popularBooksList = [];

  readDate() async {
    await rootBundle.loadString("json/popularBooks.json").then((s) {
      json
          .decode(s)
          .forEach((value) => popularBooksList.add(BookModel.fromJson(value)));
      setState(() {
        popularBooks = json.decode(s);
      });
    });
    // print(popularBooksList.length);
    // print(popularBooksList[2].id);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);

  
    readDate();
  }

  var buttonBackgrounds = [
    AppColors.menu1Color,
    AppColors.menu2Color,
    AppColors.menu3Color,
  ];
  @override
  Widget build(BuildContext context) {
   
 
    return Scaffold(
      body: Container(
        // color: Colors.white,
        padding: EdgeInsets.only(top: Dimensions.height20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //app bar
          Container(
            margin: EdgeInsets.only(left: Dimensions.height10),
            child: NavBar(),
          ),
          SizedBox(height: Dimensions.height10),
          // text
          Container(
            margin: EdgeInsets.only(left: Dimensions.height15),
            child: BigText(text: "Popular Books"),
          ),
          SizedBox(height: Dimensions.height10),
          // slider
          Container(
            height: Dimensions.screenHeight * .22,
            child: PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemCount: popularBooks == null ? 0 : popularBooks.length,
                itemBuilder: (_, index) {
                  return SliderItem(index: index);
                }),
          ),

          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool isScroll) {
                return [
                  SliverAppBar(
                    backgroundColor: AppColors.silverBackground,
                    shadowColor: Colors.red,
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: Container(
                        margin: EdgeInsets.all(0),
                        child: TabBar(
                          indicatorPadding: EdgeInsets.all(0),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.only(
                              right: Dimensions.height10,
                              bottom: Dimensions.height10 * .3),
                          controller: _tabController,
                          isScrollable: true,
                          indicator: BoxDecoration(),
                          tabs: [
                            TabItem(
                                text: "New",
                                backgroundColor: AppColors.menu1Color),
                            TabItem(
                                text: "Popular",
                                backgroundColor: AppColors.menu2Color),
                            TabItem(
                                text: "Trending",
                                backgroundColor: AppColors.menu3Color),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  //new
                  Material(
                    child: ListView.builder(
                      itemCount: popularBooksList.length,
                      itemBuilder: (context, index) {
                        return MainItem(
                          book: popularBooksList[index],
                          backgroundColor:
                              buttonBackgrounds[_tabController.index],
                        );
                      },
                    ),
                  ),
                  // popular
                  Material(
                    child: ListView.builder(
                      itemCount: popularBooksList.length,
                      itemBuilder: (context, index) {
                        return MainItem(
                          book: popularBooksList[index],
                          backgroundColor:
                              buttonBackgrounds[_tabController.index],
                        );
                      },
                    ),
                  ),
                  // trending
                  Material(
                    child: ListView.builder(
                      itemCount: popularBooksList.length,
                      itemBuilder: (context, index) {
                        return MainItem(
                          book: popularBooksList[index],
                          backgroundColor:
                              buttonBackgrounds[_tabController.index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
