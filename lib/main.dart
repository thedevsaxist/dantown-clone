import 'package:d_crypto_lite/app.dart';
import 'package:d_crypto_lite/core/service_locators.dart';
import 'package:d_crypto_lite/presentation/state/login_screen_view_model.dart';
import 'package:d_crypto_lite/presentation/state/sign_up_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => sl<ILoginScreenViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<ISignUpScreenViewModel>()),
      ],
      child: const DCryptoLite(),
    ),
  );
}
