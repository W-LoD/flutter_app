import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
class AppTypography {
  const AppTypography._();

  static const String _mukta = 'Mukta';

  static const _color = AppColors.black;

  static final font10 = TextStyle(
    color: _color,
    fontFamily: _mukta,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 10.sp,
  );

  static final font14 = TextStyle(
    color: _color,
    fontFamily: _mukta,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
  );

  static final font_14 = TextStyle(
    color: Colors.blue,
    fontFamily: _mukta,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
  );

  static final font16 = TextStyle(
    color: _color,
    fontFamily: _mukta,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
  );

  static final font20 = TextStyle(
    color: _color,
    fontFamily: _mukta,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 20.sp,
  );

  static final font24 = TextStyle(
    color: _color,
    fontFamily: _mukta,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 24.sp,
  );

  static final font36 = TextStyle(
    color: AppColors.black,
    fontFamily: _mukta,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 36.sp,
  );
}
