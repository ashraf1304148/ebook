import 'package:get/get.dart';

class Dimensions {
  static final double screenHeight = Get.context!.height;
  static final double screenWidth = Get.context!.width;
  static final double sliderHeight = screenHeight / 2.63;
  static final double imageSliderHeight = screenHeight / 3.84;
  static final double detailedSliderHeight =
      screenHeight / 7.03 < 110 ? 110 : screenHeight / 7.03;

  // height
  static final double height5 = screenHeight / 168.8;

  static final double height10 = screenHeight / 84.4;
  static final double height15 = screenHeight / 56.27;
  static final double height20 = screenHeight / 42.2;
  static final double height30 = screenHeight / 28.13;
  static final double height45 = screenHeight / 18.75;
  // width
  static final double width5 = screenHeight / 168.8;

  static final double width10 = screenHeight / 84.4;
  static final double width15 = screenHeight / 56.27;
  static final double width20 = screenHeight / 42.2;
  static final double width30 = screenHeight / 28.13;
  static final double width45 = screenHeight / 18.75;
  // font
  static final double font16 = screenHeight / 52.75;

  static final double font20 = screenHeight / 42.2;
  static final double font26 = screenHeight / 32.46;

  // icon size
  static final double iconSize24 = screenHeight / 35.17;
  static final double iconSize26 = screenHeight / 32.46;

  // menu item
  static final double itemImageWidth = screenWidth / 3.76;
  static final double itemImageHeight = itemImageWidth;

  /************ food_page_details */
  static final double bannerImage = screenHeight / 2.41;
  // bottom Bar
  static final double bottomHeightBar = screenHeight / 7.03;

  // splash screen dimentions
  static final double splashImg = screenHeight / 3.375;

  // raduis
  static final double radius10 = screenHeight / 84.4;
}
