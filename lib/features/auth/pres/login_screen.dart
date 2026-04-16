import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sas_go/shared/app_button.dart';
import 'package:sas_go/shared/app_logo.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/helper/extentions.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/text_styles.dart';
import '../../../shared/app_text_form_field.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

              verticalSpace(64),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppStrings.loginNow,
                  style: TextStyles.font16DarkBlueSemiBold,
                ),
              ),

              verticalSpace(32),

              AppTextFormField(
                hintText: AppStrings.email,
                controller: TextEditingController(),
                suffixIcon: const Icon(
                  Icons.email_outlined,
                  color: AppColors.darkBlue,
                ),
              ),

              verticalSpace(24),

              AppTextFormField(
                hintText: AppStrings.password,
                controller: TextEditingController(),
                suffixIcon: const Icon(
                  Icons.lock_outline,
                  color: AppColors.darkBlue,
                ),
                isPassword: true,
                obscureText: true,
              ),

              verticalSpace(24),

              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    AppStrings.areYouForgotPassword,
                    style: TextStyles.font10DarkBlueBold.copyWith(
                      color: AppColors.lightBlue,
                    ),
                  ),
                ),
              ),

              verticalSpace(32),

              AppButton(
                  text: AppStrings.login,
                  color: AppColors.lightBlue,
                  borderColor: Colors.transparent,
                  radius: 16,
                  onTap: () {}
              ),

              verticalSpace(32),

              RichText(
                text: TextSpan(
                  text: AppStrings.dontHaveAccount,
                  style: TextStyles.font14BlueGerySemiBold,
                  children: [
                    TextSpan(
                      text: AppStrings.createAccount,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.pushNamed(AppRoutes.loginOrRegisterScreen),
                      style: TextStyles.font14BlueGerySemiBold.copyWith(
                        color: AppColors.lightBlue
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}