import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo_app/app/data/database/hive_adapter.dart';
import 'package:todo_app/app/themes/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:todo_app/app/routes/app_pages.dart';
import 'package:todo_app/app/themes/app_theme.dart';
import 'package:todo_app/app/translations/app_translations.dart';
import 'package:todo_app/app/utils/common.dart';
import 'package:todo_app/app/utils/extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveAdapter.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    "Your device locale: ${Get.deviceLocale}".logStr(name: 'Locale');
    return GestureDetector(
      // Dismiss keyboard when clicked outside
      onTap: () => Common.dismissKeyboard(),
      child: GetMaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          defaultScaleFactor: 1.2,
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: const ColoredBox(color: AppColors.white),
        ),
        initialRoute: AppRoutes.initial,
        theme: AppThemes.lightTheme,
        getPages: AppPages.pages,
        locale: AppTranslation.locale,
        translationsKeys: AppTranslation.translations,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
