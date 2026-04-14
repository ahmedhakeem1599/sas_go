import 'package:flutter/material.dart';
import 'package:sas_go/core/helper/spacing.dart';
import 'package:sas_go/core/theme/text_styles.dart';
import 'onboarding_line_indicator.dart';

class OnBoardingPageItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int currentIndex;
  final int totalPages;

  const OnBoardingPageItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: Image.asset(image)),

        verticalSpace(15),

        Center(
          child: OnBoardingLineIndicator(
            currentIndex: currentIndex,
            count: totalPages,
          ),
        ),

        verticalSpace(34),

        Text(
          title,
          style: TextStyles.font16DarkBlueSemiBold,
        ),

        verticalSpace(20),

        Text(
          description,
          style: TextStyles.font14BlueGeryRegular,
          textAlign: TextAlign.end,
        ),

        verticalSpace(56),
      ],
    );
  }
}