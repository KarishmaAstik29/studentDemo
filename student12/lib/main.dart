import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:student12/src/core/multi_language/app_localizations.dart';
import 'package:student12/src/core/multi_language/initial_language.dart';
import 'package:student12/src/core/multi_language/tk_localizations.dart';

import 'package:student12/src/student/provider/student_provider.dart';
import 'package:student12/src/student/sl/sl_student.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await slStudentInit();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown],
  ).then((value) {
    runZonedGuarded(() {
      runApp(
          MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_)=>slStudent<StudentProvider>(),),

            ],//child: MyApp(settingsController: settingsController),
              // if you want to change default language, go to lib/ui/feature/multi_language/initial_language.dart and change en US to your default language
      child: InitialLanguage(
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              scrollBehavior: MyCustomScrollBehavior(),
              title: APP_NAME,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                  /*
                  Below is the example to change MaterialPageRoute default transition in iOS and Android :
                   FadeUpwardsPageTransitionsBuilder() <= Default MaterialPageRoute Transition
                   OpenUpwardsPageTransitionsBuilder()
                   ZoomPageTransitionsBuilder()
                   CupertinoPageTransitionsBuilder()
                  */
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                }),
              ),
              // below is used for language feature
              supportedLocales: [
                Locale('en', 'US'),
                Locale('id', 'ID'),
                Locale('ar', 'DZ'),
                Locale('zh', 'HK'),
                Locale('hi', 'IN'),
                Locale('th', 'TH'),
                Locale('tk', 'TK'),
              ],
              // These delegates make sure that the localization data for the proper language is loaded
              localizationsDelegates: [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                MaterialLocalizationTkDelegate() // Add for custom localizations, if not use custom localization, remove this line
              ],
              // Returns a locale which will be used by the app
              locale: (state is ChangeLanguageSuccess)?state.locale:Locale('en', 'US'),
              home: SplashScreenPage(),
            );
          }
        ),
      ),
          )
      );
    }, (dynamic error, dynamic stack) {
    });
  });

}
