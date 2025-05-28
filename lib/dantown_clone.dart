import 'package:dantown_clone/app/core/routes/routers.dart';
import 'package:dantown_clone/app/core/theme.dart';
import 'package:dantown_clone/app/features/auth/data/services/auth_services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DantownClone extends StatelessWidget {
  const DantownClone({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<IAuthServices>();
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Dantown Clone',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          themeMode: ThemeMode.light,
          routerConfig: Routers.config(auth),
        );
      },
    );
  }
}
