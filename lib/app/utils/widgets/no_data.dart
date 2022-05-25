import 'package:flutter/material.dart';
import 'package:todo_app/app/translations/app_translations.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppTranslationKey.noData,
        textAlign: TextAlign.center,
      ),
    );
  }
}
