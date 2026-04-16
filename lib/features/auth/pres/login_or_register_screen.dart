import 'package:flutter/material.dart';
import 'package:sas_go/shared/app_button.dart';
import 'package:sas_go/shared/app_logo.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/helper/extentions.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/text_styles.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _AuthSelectionScreenState();
}

class _AuthSelectionScreenState extends State<LoginOrRegisterScreen> with TickerProviderStateMixin {
  late AnimationController _topController;
  late AnimationController _bottomController;

  late Animation<Offset> _topAnimation;
  late Animation<Offset> _bottomAnimation;

  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _topController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _bottomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _topAnimation =
        Tween<Offset>(begin: const Offset(0, -1.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _topController, curve: Curves.easeOutCubic),
        );

    _bottomAnimation =
        Tween<Offset>(begin: const Offset(0, 1.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _bottomController,
            curve: Curves.easeOutCubic,
          ),
        );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _bottomController, curve: Curves.easeIn));

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _topController.forward();

        Future.delayed(
          const Duration(milliseconds: 300),
          () => _bottomController.forward(),
        );
      }
    });
  }

  @override
  void dispose() {
    _topController.dispose();
    _bottomController.dispose();
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
              const Spacer(),

              SlideTransition(
                position: _topAnimation,
                child: Column(
                  children: [
                    const AppLogo(),

                    verticalSpace(24),

                    Text(
                      AppStrings.welcomeToSaS,
                      style: TextStyles.font24WhiteBold,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SlideTransition(
                position: _bottomAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      AppButton(
                        text: AppStrings.login,
                        onTap: () => context.pushNamed(AppRoutes.loginScreen),
                        radius: 16,
                        textStyle: TextStyles.font20WhiteMedium,
                      ),

                      verticalSpace(24),

                      AppButton(
                        text: AppStrings.createAccount,
                        onTap: () {},
                        borderWidth: 2,
                        color: Colors.transparent,
                        radius: 16,
                        textStyle: TextStyles.font20WhiteMedium.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
