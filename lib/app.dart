import 'package:d_crypto_lite/core/routers.dart';
import 'package:d_crypto_lite/core/theme.dart';
import 'package:flutter/material.dart';

class DCryptoLite extends StatelessWidget {
  const DCryptoLite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'D-Crypto Lite',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      themeMode: ThemeMode.light,
      routerConfig: Routers.config(),
    );
  }
}
