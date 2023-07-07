import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projects/home_page.dart';
import 'package:projects/ship.dart';
import 'package:projects/verify.dart';

import 'mob_no.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      initialRoute: 'HomePage',
      routes: {
        'HomePage': (context) => HomePage(),
        'Scene2': (context) => Scene2(),
        'Verify':(context)=> Verify(),
        'Ship':(context)=> Ship(),
      },
    );
  }
}