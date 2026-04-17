import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/helper/spacing.dart';
import '../core/theme/text_styles.dart';

class UploadCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final File? image;
  final bool isLoading;

  const UploadCard({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = Icons.upload_file_outlined,
    this.image,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.lightGray,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// لو في صورة
            if (image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  image!,
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              )

            /// لو مفيش صورة
            else
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGray.withValues(alpha: 0.2),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: isLoading ? const CircularProgressIndicator() : Icon(icon),
              ),

            verticalSpace(12),

            Text(
              title,
              style: TextStyles.font14BlueGeryRegular,
            ),
          ],
        ),
      ),
    );
  }
}