import 'package:ebook/utils/dimensions.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.home, size: Dimensions.iconSize26 * 1.5),
              Row(
                children: [
                  Icon(Icons.search, size: Dimensions.iconSize26 * 1.5),
                  SizedBox(width: Dimensions.height10),
                  Icon(Icons.add_alert_rounded,
                      size: Dimensions.iconSize26 * 1.5),
                ],
              )
            ],
          );
  }
}