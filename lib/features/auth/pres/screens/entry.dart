import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/dep_injection.dart';
import '../../../../core/network/local/shared_pref.dart';
import '../../../../core/routes/app_routes.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  @override
  void initState() {
    super.initState();
    _checkFirstTimeOpenApp();
  }

  Future<void> _checkFirstTimeOpenApp() async {
    final storage = sl<LocalStorageService>();
    final isFirst = await storage.isFirstTime();


    if (isFirst) {
      await storage.setNotFirstTime();
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    } else {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.loginOrRegisterScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CupertinoActivityIndicator()),
    );
  }
}