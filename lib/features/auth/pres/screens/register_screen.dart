import 'package:flutter/material.dart';
import 'package:sas_go/features/auth/pres/widgets/register/shipment_owner_register_body.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/extentions.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/auth_footer_text.dart';
import '../widgets/register/driver_register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key , required this.rule});
  final int rule; //driver = 1                //Shipment owner = 0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.createAccount,
          style: TextStyles.font24DarkBlueBold,
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16),

              //driver = 1                //Shipment owner = 0
              rule == 0
                  ? ShipmentOwnerRegisterBody()
                  : DriverRegisterBody(),


              verticalSpace(12),

              AuthFooterText(
                textOne: AppStrings.alreadyHaveAccount,
                textTwo: AppStrings.login,
                onTap: () => context.pushReplacementNamed(AppRoutes.loginScreen),
              ),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}
