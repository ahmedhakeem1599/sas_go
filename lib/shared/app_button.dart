import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.radius,
    this.textStyle,
    this.color,
    this.borderColor,
    this.borderWidth,
  });

  final String text;
  final Function()? onTap;
  final double? radius;
  final TextStyle? textStyle;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? AppColors.darkBlue,
          borderRadius: BorderRadius.circular(radius?.r ?? 8.r),
          border: Border.all(
            color: borderColor == null ? Colors.transparent : AppColors.darkBlue,
            width: borderWidth ?? 1.w,
          ),
        ),
        alignment: Alignment.center,
        child: Text(text, style: textStyle ?? TextStyles.font18WhiteSemiBold),
      ),
    );
  }
}
