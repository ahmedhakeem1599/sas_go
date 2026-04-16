import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/theme/text_styles.dart';

class AppTextFormField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextAlign textAlign;
  final Color? borderColor;
  final bool isMandatory;
  final Function(String)? onChanged;
  final int maxLines;
  final bool isPassword;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.borderColor,
    this.textAlign = TextAlign.right,
    this.isMandatory = false,
    this.onChanged,
    this.maxLines = 1,
    this.isPassword = false,
  });

  @override
  State<AppTextFormField> createState() =>
      _AppTextFormFieldState();
}

class _AppTextFormFieldState
    extends State<AppTextFormField> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = widget.obscureText;
    super.initState();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText:
      widget.isPassword ? _isObscure : false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      textAlign: widget.textAlign,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      textDirection: TextDirection.rtl,
      style: TextStyles.font14DarkMedium,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.isMandatory
            ? '${widget.hintText} *'
            : widget.hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyles.font14LightGrayMedium,

        prefixIcon: widget.isPassword
            ? IconButton(
          onPressed:
          _togglePasswordVisibility,
          icon: Icon(
            _isObscure
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        ) : widget.prefixIcon,

        suffixIcon: widget.suffixIcon,

        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),

        border: borderStyle(),
        enabledBorder: borderStyle(),
        focusedBorder: focusedBorderStyle(),
        errorBorder: errorBorderStyle(),
        focusedErrorBorder: errorBorderStyle(),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.lightGray,
      ),
    );
  }

  OutlineInputBorder focusedBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.lightGray,
      ),
    );
  }

  OutlineInputBorder errorBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: Colors.red),
    );
  }
}