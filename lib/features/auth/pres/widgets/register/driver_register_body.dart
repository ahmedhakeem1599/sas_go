import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/helper/ImagePickerHelper.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/helper/validators.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../shared/app_button.dart';
import '../../../../../shared/app_text_form_field.dart';
import '../../../../../shared/upload_card.dart';


class DriverRegisterBody extends StatefulWidget {
  const DriverRegisterBody({super.key});

  @override
  State<DriverRegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<DriverRegisterBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usedNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _conformPassController = TextEditingController();
  final TextEditingController _invitationCodeController = TextEditingController();

  File? nationalIdImage;
  File? drivingLicenseImage;
  File? truckImage;

  void _createAccount() {
    if (_formKey.currentState!.validate()) {
      // create account logic
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usedNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passController.dispose();
    _conformPassController.dispose();
    _invitationCodeController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// Full Name
          Text(AppStrings.fullName, style: TextStyles.font16DarkBlueSemiBold),
          verticalSpace(4),
          AppTextFormField(
            hintText: AppStrings.fullName,
            controller: _fullNameController,
            validator: (value) =>
                AppValidators.validateRequiredField(value, AppStrings.fullName),
            isMandatory: true,
          ),

          verticalSpace(8),

          /// Used Name
          Text(AppStrings.usedNameEn, style: TextStyles.font16DarkBlueSemiBold),
          verticalSpace(4),
          AppTextFormField(
            hintText: AppStrings.usedName,
            controller: _usedNameController,
            validator: AppValidators.validateEnglishOnly,
            isMandatory: true,
          ),

          verticalSpace(8),

          /// Email
          Text(AppStrings.emailCh, style: TextStyles.font16DarkBlueSemiBold),
          verticalSpace(4),
          AppTextFormField(
            hintText: AppStrings.email,
            validator: AppValidators.validateEmail,
            controller: _emailController,
          ),

          verticalSpace(8),

          /// Phone Number
          Text(
            AppStrings.numberPhone,
            style: TextStyles.font16DarkBlueSemiBold,
          ),
          verticalSpace(4),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.lightGray, width: 1),
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.sudiLogo, height: 24, width: 24),
                      horizontalSpace(4),
                      Text("+966", style: TextStyles.font14LightGrayMedium),
                    ],
                  ),
                ),

                horizontalSpace(4),

                Expanded(
                  child: AppTextFormField(
                    hintText: AppStrings.numberPhone,
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                    validator: AppValidators.validateSaudiPhone,
                    isMandatory: true,
                  ),
                ),
              ],
            ),
          ),

          verticalSpace(8),

          /// PassWord
          Text(AppStrings.pass, style: TextStyles.font16DarkBlueSemiBold),
          verticalSpace(4),
          AppTextFormField(
            hintText: AppStrings.pass,
            controller: _passController,
            validator: AppValidators.validatePassword,
            isMandatory: true,
            isPassword: true,
          ),

          verticalSpace(8),

          /// Conform PassWord
          Text(
            AppStrings.conformPass,
            style: TextStyles.font16DarkBlueSemiBold,
          ),
          verticalSpace(4),
          AppTextFormField(
            hintText: AppStrings.conformPass,
            controller: _conformPassController,
            validator: AppValidators.validatePassword,
            isMandatory: true,
            isPassword: true,
          ),

          verticalSpace(8),

          /// Conform PassWord
          Text(
            AppStrings.invitationCode,
            style: TextStyles.font16DarkBlueSemiBold,
          ),
          verticalSpace(4),
          AppTextFormField(
            hintText: AppStrings.invitationCode,
            controller: _invitationCodeController,
          ),

          verticalSpace(12),

          /// Upload Images
          UploadCard(
            title: AppStrings.nationalId,
            image: nationalIdImage,
            onTap: () async {

              final file = await ImagePickerHelper.pickImage(context);

              if (file != null) {
                setState(() {
                  nationalIdImage = file;
                });
              }
              },
          ),
          verticalSpace(8),
          UploadCard(
            title: AppStrings.drivingLicense,
            image: drivingLicenseImage,
            onTap: () async {
              final file = await ImagePickerHelper.pickImage(context);

              if (file != null) {
                setState(() {
                  drivingLicenseImage = file;
                });
              }

            },
          ),
          verticalSpace(8),
          UploadCard(
            title: AppStrings.truckImage,
            image: truckImage,
            onTap: () async {

              final img = await ImagePickerHelper.pickImage(context);

              if (img != null) {
                setState(() {
                  truckImage = img;
                });
              }
              },
          ),


          verticalSpace(32),

          /// Create Account
          AppButton(
            text: AppStrings.createAccount,
            onTap: _createAccount,
            radius: 16,
          ),

        ],
      ),
    );
  }
}
