import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:student/src/home/view/pages/dashboard/home_dashboard.dart';
import 'package:student/src/student/language_translation.dart';
import 'package:student/src/student/provider/student_provider.dart';
import 'package:student/src/student/sl/sl_student.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await slStudentInit();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((value) {
    runZonedGuarded(() {
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => slStudent<StudentProvider>(),
          ),
        ], //child: MyApp(settingsController: settingsController),
        child: GetMaterialApp(
          translations: LanguageTranslation(),
          locale: Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          title: 'Futter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeDashboardPage(),
        ),
      ));
    }, (dynamic error, dynamic stack) {});
  });
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       translations: LanguageTranslation(),
//       locale: Locale('en', 'US'),
//       debugShowCheckedModeBanner: false,
//       title: 'Futter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeDashboardPage(),
//     );
//   }
// }
