import 'package:d_crypto_lite/d_crypto_lite.dart';
import 'package:d_crypto_lite/app/core/service_locators.dart';
import 'package:d_crypto_lite/app/features/auth/data/services/auth_services.dart';
import 'package:d_crypto_lite/app/features/home/presentation/state/dashboard_view_model.dart';
import 'package:d_crypto_lite/app/features/auth/presentation/state/login_screen_view_model.dart';
import 'package:d_crypto_lite/app/features/auth/presentation/state/sign_up_screen_view_model.dart';
import 'package:device_preview/device_preview.dart';
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
        ChangeNotifierProvider(create: (_) => sl<IAuthServices>()),
      ],
      child: DevicePreview(
        backgroundColor: Colors.white,
        defaultDevice: Devices.ios.iPhone13,
        isToolbarVisible: true,
        availableLocales: const [Locale('en', 'US')],
        tools: const [
          // ...DevicePreview.defaultTools,
          DeviceSection(
            model: false,
            orientation: false,
            frameVisibility: false,
            virtualKeyboard: true,
          ),
        ],
        devices: [
          Devices.ios.iPhoneSE,
          Devices.ios.iPhone13Mini,
          Devices.ios.iPhone13,
          Devices.android.samsungGalaxyA50,
          Devices.android.bigPhone,
          Devices.android.mediumPhone,
          Devices.android.smallPhone,
        ],
        builder: (_) => const DCryptoLite()),
    ),
  );
}
