import 'package:currency/src/features/converting/data/repositories/currencies_repository.dart';
import 'package:currency/src/features/converting/domain/entity/rate.dart';
import 'package:flutter/widgets.dart';

class ConvertRateVm with ChangeNotifier {
  ConvertRateVm(this.repository);

  final CurrenciesRepository repository;

  String _firstValue = '';

  String _secondValue = '';

  String get firstValue => _firstValue;
  String get secondValue => _secondValue;

  Future<void> setFirstVal(String val) async {
    _firstValue = val;
    _secondValue = (int.parse(val) * 10).toString();
  }

  Future<Rate> convert({
    required String baseCurrency,
    required String to,
  }) async {
    final rate = await repository.fetchRate(to: to, baseCurrency: baseCurrency);
    return rate;
  }
}
