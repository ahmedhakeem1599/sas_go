import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sas_go/sas_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// to fix text hidden bug in flutter screenUtil
  await ScreenUtil.ensureScreenSize();

  runApp(const SasApp());
}
