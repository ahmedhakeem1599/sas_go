import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../shared/app_logo.dart';
import '../widgets/row_type_card.dart';

class SelectionTypeScreen extends StatefulWidget {
  const SelectionTypeScreen({super.key});

  @override
  State<SelectionTypeScreen> createState() => _SelectionTypeScreenState();
}

class _SelectionTypeScreenState extends State<SelectionTypeScreen> {

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

              verticalSpace(95),

              Text(
                AppStrings.choseAccountType,
                style: TextStyles.font24DarkBlueBold,
              ),

              verticalSpace(48),

              RowTypeCard(),

            ],
          ),
        ),
      ),
    );
  }


}
