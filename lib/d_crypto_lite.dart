import 'package:d_crypto_lite/app/core/routes/routers.dart';
import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:d_crypto_lite/app/features/auth/data/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DCryptoLite extends StatelessWidget {
  const DCryptoLite({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<IAuthServices>();
    return MaterialApp.router(
      title: 'D-Crypto Lite',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      themeMode: ThemeMode.light,
      routerConfig: Routers.config(auth),
    );
  }
}
