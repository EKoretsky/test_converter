import 'package:currency/src/features/converting/data/repositories/currencies_repository.dart';
import 'package:currency/src/features/converting/domain/entity/currency.dart';
import 'package:flutter/foundation.dart';

class CurrenciesVm with ChangeNotifier {
  CurrenciesVm(this._repository);

  final CurrenciesRepository _repository;

  bool _isLoading = false;
  List<Currency> _currencies = [];

  String _firstCurrencyCode = 'RUB';

  String _secondCurrencyCode = 'USD';

  bool get isLoading => _isLoading;

  List<Currency> get currencies => _currencies;

  String get firstCurrencyCode => _firstCurrencyCode;

  String get secondCurrencyCode => _secondCurrencyCode;

  double _rate = 0;

  double _firstValue = 0;

  double get firstValue => _firstValue;
  set firstValue(double val) {
    _firstValue = val;
    _secondValue = val * _rate;
    notifyListeners();
  }

  double _secondValue = 0;

  double get secondValue => _secondValue;
  set secondValue(double val) {
    _secondValue = val;
    _firstValue = val * _rate;
    notifyListeners();
  }

  Future<void> fetchCurrencies() async {
    _isLoading = true;
    notifyListeners();
    _currencies = await _repository.getCurrencies();
    _isLoading = false;
    notifyListeners();
  }

  void setFirstCurrencyCode(String code) {
    _firstCurrencyCode = code;
    notifyListeners();
  }

  void setSecondCurrencyCode(String code) {
    _secondCurrencyCode = code;
    notifyListeners();
  }

  Future<void> convert({
    required String base,
    required String to,
  }) async {
    final result = await _repository.fetchRate(to: to, base: base);
    print(result);
    _rate = result.rate;
  }
}
