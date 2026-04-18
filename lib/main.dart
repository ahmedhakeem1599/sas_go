import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sas_go/sas_app.dart';

import 'core/di/dep_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// to fix text hidden bug in flutter screenUtil
  await ScreenUtil.ensureScreenSize();

  /// Initialize dependency injection
  await di.configureDepInjections();

  runApp(const SasApp());
}
