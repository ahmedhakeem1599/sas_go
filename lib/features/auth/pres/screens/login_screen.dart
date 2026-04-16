import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sas_go/shared/app_logo.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/extentions.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/login_body.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
          
                verticalSpace(32),
          
                AppLogo(height: 66.h, width: 193.w),
          
                verticalSpace(8),
          
                Text(AppStrings.welcomeToSaS, style: TextStyles.font24DarkBlueBold),
          
                verticalSpace(64),
          
                LoginBody(),
          
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
                        style: TextStyles.font12lightBlueBold
                      ),
                    ],
                  ),
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}