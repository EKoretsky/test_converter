import 'package:currency/src/config/api_config.dart';
import 'package:currency/src/features/converting/data/remote/currencies_data_source.dart';
import 'package:currency/src/features/converting/data/repositories/currencies_repository.dart';
import 'package:currency/src/features/converting/presentation/vm/currencies_vm.dart';
import 'package:currency/src/theming/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiContainer extends StatelessWidget {
  const DiContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AppTheme(),
        ),
        Provider.value(value: dioConfig),
        Provider(
          create: (context) {
            final dio = context.read<Dio>();
            return CurrenciesRepository(
              CurrenciesDataSource(dio),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CurrenciesVm(context.read<CurrenciesRepository>());
          },
        ),
      ],
      child: child,
    );
  }
}
