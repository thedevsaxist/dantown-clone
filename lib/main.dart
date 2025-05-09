import 'package:d_crypto_lite/app.dart';
import 'package:d_crypto_lite/core/service_locators.dart';
import 'package:d_crypto_lite/presentation/state/dashboard_view_model.dart';
import 'package:d_crypto_lite/presentation/state/login_screen_view_model.dart';
import 'package:d_crypto_lite/presentation/state/sign_up_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();

  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<ILoginScreenViewModel>()),
        ChangeNotifierProvider(create: (_) => sl<ISignUpScreenViewModel>()),
        ChangeNotifierProvider(create: (_) => sl<IDashboardViewModel>()),
      ],
      child: const DCryptoLite(),
    ),
  );
}
