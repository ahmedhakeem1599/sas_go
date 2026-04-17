import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sas_go/shared/app_button.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/extentions.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/text_styles.dart';

class RowTypeCard extends StatefulWidget {
  const RowTypeCard({super.key});

  @override
  State<RowTypeCard> createState() => _RowTypeCardState();
}

class _RowTypeCardState extends State<RowTypeCard> {
  int selectedIndex = -1;

  void _onTap() {
    selectedIndex == -1 ? null
        : context.pushNamed(AppRoutes.registerScreen , arguments: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTypeCard(
              index: 0,
              title: AppStrings.customer,
              image: AppAssets.person,
            ),
            _buildTypeCard(
              index: 1,
              title: AppStrings.trucker,
              image: AppAssets.truck,
            ),
          ],
        ),

        verticalSpace(72),
        AppButton(
          text: AppStrings.next,
          color: selectedIndex != -1 ? AppColors.darkBlue : Colors.lightBlue,
          onTap: _onTap,
          radius: 16,
        ),
      ],
    );
  }

  Widget _buildTypeCard({
    required int index,
    required String title,
    required String image,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.darkBlue : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Image.asset(image, height: 88.h, width: 88.w),
            verticalSpace(30),
            Text(title, style: TextStyles.font14BlueGeryBold),
          ],
        ),
      ),
    );
  }
}
