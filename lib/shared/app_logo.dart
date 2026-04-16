import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_assets.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({super.key , this.height , this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        AppAssets.logo,
        height: height ?? 107.h,
        width: width ?? 312.w
    );
  }
}
