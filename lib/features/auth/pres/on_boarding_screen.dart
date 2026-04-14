import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sas_go/core/helper/spacing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sas_go/core/constants/app_colors.dart';
import 'package:sas_go/core/constants/app_strings.dart';
import 'package:sas_go/core/theme/text_styles.dart';

import '../../../core/constants/app_assets.dart';
import '../../../shared/app_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "image": AppAssets.onBoardingOne,
      "title": AppStrings.onBoardingOneTitle,
      "description": AppStrings.onBoardingOneDes,
    },
    {
      "image": AppAssets.onBoardingTwo,
      "title": AppStrings.onBoardingTwoTitle,
      "description": AppStrings.onBoardingTwoDes,
    },
    {
      "image": AppAssets.onBoardingThree,
      "title": AppStrings.onBoardingThreeTitle,
      "description": AppStrings.onBoardingThreeDes,
    },
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to login/home
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [

              /// Skip button
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Navigate to login/home
                  },
                  child: Text(
                    AppStrings.skip,
                    style: TextStyles.font14LightGraySemiBold,
                  ),
                ),
              ),

              /// on boarding pages
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(child: Image.asset(pages[index]["image"]!)),

                        verticalSpace(15),

                        Center(
                          child: AnimatedSmoothIndicator(
                            activeIndex: currentIndex,
                            count: 3,
                            effect: WormEffect(
                              dotHeight: 5.h,
                              dotWidth: 36.6.w,
                              spacing: 4.w,
                              activeDotColor: AppColors.darkBlue,
                              dotColor: AppColors.lightGray,
                            ),
                          ),
                        ),

                        verticalSpace(34),

                        Text(
                          pages[index]["title"]!,
                          style: TextStyles.font16DarkBlueSemiBold,
                        ),

                        verticalSpace(20),

                        Text(
                          pages[index]["description"]!,
                          style: TextStyles.font14LightGrayRegular,
                          textAlign: TextAlign.end,
                        ),

                        verticalSpace(56),
                      ],
                    );
                  },
                ),
              ),

              /// Next button
              AppButton(
                onTap: nextPage,
                text: currentIndex == 2 ? AppStrings.getNow : AppStrings.next,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
