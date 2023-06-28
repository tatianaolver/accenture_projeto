import 'package:flutter/material.dart';
import 'TelaInicial.dart';
import 'TelaCadastro.dart';
import 'TelaEntrar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:helloworld/services/CheckLogin.dart';
import 'package:intl/date_symbol_data_local.dart';

Future main() async {
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CheckLogin(),
  ));
}
