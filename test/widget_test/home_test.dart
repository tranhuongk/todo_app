import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_app/app/routes/app_pages.dart';
import 'package:todo_app/app/themes/app_theme.dart';
import 'package:todo_app/app/translations/app_translations.dart';

Widget createHomeScreen() => GetMaterialApp(
      initialRoute: AppRoutes.home,
      theme: AppThemes.lightTheme,
      getPages: AppPages.pages,
      locale: AppTranslation.locale,
      translationsKeys: AppTranslation.translations,
      debugShowCheckedModeBanner: false,
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Testing Icon', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.all_inbox), findsOneWidget);
      expect(find.byIcon(Icons.done_all_rounded), findsOneWidget);
      expect(find.byIcon(Icons.pending_actions_rounded), findsOneWidget);
      expect(find.byIcon(Icons.telegram), findsNothing);
      expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    });
    testWidgets('Testing Text', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text("There are no records yet.\nPlease add tasks!"),
          findsOneWidget);
      expect(find.text("All"), findsOneWidget);
    });

    testWidgets('Testing Pressed Icon', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      await tester.tap(find.byIcon(Icons.all_inbox).first);
      await tester.tap(find.byIcon(Icons.done_all_rounded).first);
      await tester.tap(find.byIcon(Icons.pending_actions_rounded).first);
    });
  });
}
