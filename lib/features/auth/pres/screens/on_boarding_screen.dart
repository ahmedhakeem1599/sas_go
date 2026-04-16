import 'package:flutter/material.dart';
import 'package:sas_go/core/constants/app_assets.dart';
import 'package:sas_go/core/constants/app_strings.dart';
import 'package:sas_go/core/theme/text_styles.dart';
import 'package:sas_go/shared/app_button.dart';
import '../../../../core/helper/extentions.dart';
import '../../../../core/routes/app_routes.dart';
import '../widgets/onboarding/onboarding_pageItem.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  final List<OnBoardingModel> _pages = const [
    OnBoardingModel(
      image: AppAssets.onBoardingOne,
      title: AppStrings.onBoardingOneTitle,
      description: AppStrings.onBoardingOneDes,
    ),
    OnBoardingModel(
      image: AppAssets.onBoardingTwo,
      title: AppStrings.onBoardingTwoTitle,
      description: AppStrings.onBoardingTwoDes,
    ),
    OnBoardingModel(
      image: AppAssets.onBoardingThree,
      title: AppStrings.onBoardingThreeTitle,
      description: AppStrings.onBoardingThreeDes,
    ),
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _goToNextPage() {
    final isLastPage = _currentIndex == _pages.length - 1;

    if (isLastPage) {
      _navigateToHome();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }

  void _skipOnBoarding() {
    _navigateToHome();
  }

  void _navigateToHome() {
    context.pushNamed(AppRoutes.loginOrRegisterScreen);
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get isLastPage => _currentIndex == _pages.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _buildSkipButton(),

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _pages.length,
                        reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: _onPageChanged,
                        itemBuilder: (context, index) {
                          final page = _pages[index];

                          return OnBoardingPageItem(
                            image: page.image,
                            title: page.title,
                            description: page.description,
                            currentIndex: _currentIndex,
                            totalPages: _pages.length,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              AppButton(
                onTap: _goToNextPage,
                text: isLastPage
                    ? AppStrings.getNow
                    : AppStrings.next,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: _skipOnBoarding,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            AppStrings.skip,
            style: TextStyles.font14BlueGerySemiBold,
          ),
        ),
      ),
    );
  }
}

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  const OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}