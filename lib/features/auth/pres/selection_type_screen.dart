import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theme/text_styles.dart';
import '../../../shared/app_logo.dart';

class SelectionTypeScreen extends StatelessWidget {
  const SelectionTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              verticalSpace(32),

              AppLogo(height: 66.h, width: 193.w),

              verticalSpace(8),

              Text(AppStrings.welcomeToSaS, style: TextStyles.font24WhiteBold),

              verticalSpace(24),

              Text(AppStrings.createAccount, style: TextStyles.font24WhiteBold),
            ],
          ),
        ),
      ),
    );
  }
}
