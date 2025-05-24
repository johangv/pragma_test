import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pragma_test/application/manager/dependencies.dart';
import 'package:pragma_test/presentation/pages/home/home_screen.dart';
import 'package:pragma_test/presentation/theming/theming.dart';
import 'package:pragma_test/utils/size_config.dart';

Future<void> main() async {
  setup();
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: Theming().themeData,
    );
  }
}
