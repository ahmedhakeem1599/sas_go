import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/text_styles.dart';

class UploadCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback onRemove;
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
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: image == null ? 100.h : 200.h,
        padding: EdgeInsets.symmetric(vertical: 6 , horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.lightGray, width: 2),
        ),
        child: image == null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.r),
                    margin: EdgeInsets.symmetric(vertical: 10.h),
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
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Icon(icon),
                  ),

                  Text(title, style: TextStyles.font14BlueGeryRegular),
                ],
              )
            : Stack(
               children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(16.r),
                   child: Image.file(image!, fit: BoxFit.cover, width: double.infinity),
                 ),
                 Positioned(
                   bottom: 20,
                   right: 20,
                   child: GestureDetector(
                     onTap: onRemove,
                     child: Icon(
                       Icons.close,
                       color: AppColors.red,
                       size: 24.sp,
                     ),
                   )
                 )
               ],
            ),
      ),
    );
  }
}
