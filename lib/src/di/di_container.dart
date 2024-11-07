import 'package:currency/src/features/converting/data/remote/currencies_data_source.dart';
import 'package:currency/src/features/converting/data/repositories/currencies_repository.dart';
import 'package:currency/src/features/converting/presentation/vm/conver_rate_vm.dart';
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
        Provider(
          create: (context) {
            return CurrenciesRepository(
              CurrenciesDataSource(Dio()),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CurrenciesVm(context.read<CurrenciesRepository>());
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ConvertRateVm(context.read<CurrenciesRepository>());
          },
        )
      ],
      child: child,
    );
  }
}
