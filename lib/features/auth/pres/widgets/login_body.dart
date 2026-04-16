import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/helper/validators.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../shared/app_button.dart';
import '../../../../shared/app_text_form_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // login logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
            controller: _emailController,
            validator: AppValidators.validateEmail,
            suffixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.darkBlue,
            ),
          ),

          verticalSpace(24),

          AppTextFormField(
            hintText: AppStrings.password,
            controller: _passwordController,
            validator: AppValidators.validatePassword,
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
                style: TextStyles.font12lightBlueBold,
              ),
            ),
          ),

          verticalSpace(32),

          AppButton(
            text: AppStrings.login,
            color: AppColors.darkBlue,
            borderColor: Colors.transparent,
            radius: 16,
            onTap: _login,
          ),
        ],
      ),
    );
  }
}
