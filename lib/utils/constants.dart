import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static final dynamicSize = ScreenUtil();

  static const Duration buttonDuration = Duration(milliseconds: 300);
  static const Duration requestDuration = Duration(seconds: 3);

  static String passwordRegex =
      r'(?=.*[0-9])(?=.*[a-z]).{8,}$'; //(?=.*[A-Z])(?=.*[!@#$%^&()?,./\|*№;:])
  static String emailRegex = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+';

  static final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 15.w,
    mainAxisSpacing: 16.h,
    childAspectRatio: .85,
  );

  static String mockImage =
      'https://static.1000.menu/img/content-v2/9f/82/44595/pryanyi-zimnii-pirog_1585290204_9_max.jpg';

  static final double textSize4 = dynamicSize.setSp(4);
  static final double textSize6 = dynamicSize.setSp(6);
  static final double textSize8 = dynamicSize.setSp(8);
  static final double textSize9 = dynamicSize.setSp(9);
  static final double textSize10 = dynamicSize.setSp(10);
  static final double textSize12 = dynamicSize.setSp(12);
  static final double textSize13 = dynamicSize.setSp(13);
  static final double textSize14 = dynamicSize.setSp(14);
  static final double textSize15 = dynamicSize.setSp(15);
  static final double textSize16 = dynamicSize.setSp(16);
  static final double textSize17 = dynamicSize.setSp(17);
  static final double textSize18 = dynamicSize.setSp(18);
  static final double textSize20 = dynamicSize.setSp(20);
  static final double textSize22 = dynamicSize.setSp(22);
  static final double textSize24 = dynamicSize.setSp(24);
  static final double textSize26 = dynamicSize.setSp(26);
  static final double textSize28 = dynamicSize.setSp(28);
  static final double textSize30 = dynamicSize.setSp(30);
  static final double textSize32 = dynamicSize.setSp(32);
  static final double textSize34 = dynamicSize.setSp(34);
  static final double textSize36 = dynamicSize.setSp(36);
  static final double textSize38 = dynamicSize.setSp(38);
  static final double textSize48 = dynamicSize.setSp(48);
  static final double textSize72 = dynamicSize.setSp(72);
}
