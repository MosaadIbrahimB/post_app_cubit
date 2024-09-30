import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:task/core/service/dependency_injection/service_locator.dart';
import 'firebase_options.dart';
import 'my_app.dart';


void main() async {
  setUp();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "sec.env");
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
      child: const MyApp())
  );
}
