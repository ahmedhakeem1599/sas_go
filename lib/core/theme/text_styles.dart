import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../helper/font_weight_helper.dart';

class TextStyles {

  static TextStyle font14BlueGerySemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.lightGray,
  );

  static TextStyle font16DarkBlueSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.darkBlue,
  );

  static TextStyle font12lightBlueBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.lightBlue,
  );

  static TextStyle font14BlueGeryRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.lightGray,
  );

  static TextStyle font14BlueGeryBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.darkBlue,
  );

  static TextStyle font18WhiteSemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );

  static TextStyle font24DarkBlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.darkBlue,
  );

  static TextStyle font20WhiteMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
  );

  static TextStyle font14DarkMedium = TextStyle(
    color: AppColors.black,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14LightGrayMedium = TextStyle(
    color: AppColors.lightGray,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );

}
