import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmacies/models/Applocal.dart';
import 'package:pharmacies/pages/luncher_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'models/language.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then(
    (instance) {
      runApp(GetMaterialApp(
        home: MyApp(),
        translations:
            WorldLanguage(), //Language class from world_languages.dart
        locale:
            Locale('ar', ''), // translations will be displayed in that locale
        fallbackLocale: Locale('ar',
            ''), // specify the fallback locale in case an invalid locale is selected.
      ));
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LuncherPagePharmc(),
    );
    ;
  }
}
