import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/text_styles.dart';

class AuthFooterText extends StatelessWidget {
  const AuthFooterText({
    super.key,
    required this.textOne,
    required this.textTwo,
    this.onTap,
  });

  final String textOne;
  final String textTwo;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: textOne,
        style: TextStyles.font14BlueGerySemiBold,
        children: [
          TextSpan(
            text: textTwo,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: TextStyles.font12lightBlueBold,
          ),
        ],
      ),
    );
  }
}
