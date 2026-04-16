import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sas_go/core/constants/app_colors.dart';

class OnBoardingLineIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const OnBoardingLineIndicator({
    super.key,
    required this.currentIndex,
    this.count = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count, (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: 36.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: index <= currentIndex
                  ? AppColors.darkBlue
                  : AppColors.lightGray,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
    );
  }
}
