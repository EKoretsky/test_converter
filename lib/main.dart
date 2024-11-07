import 'package:currency/src/di/di_container.dart';
import 'package:currency/src/features/converting/presentation/convert_screen.dart';
import 'package:currency/src/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DiContainer(
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Currency converter',
          theme: context.read<AppTheme>().light,
          home: const ConvertScreen(),
        );
      }),
    );
  }
}
