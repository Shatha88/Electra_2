import 'package:electra/Screens/Auth/start_screen.dart';
import 'package:electra/Screens/Consumer/con_home.dart';
import 'package:electra/Screens/Provider/screens.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Screens(),
        // home: StartScreen(),
        home: box.read('token') == ''
            ? box.read('UserType').toString().contains('CONSUMER')
                ? const ConHome()
                : const Screens()
            : const StartScreen());
  }
}
