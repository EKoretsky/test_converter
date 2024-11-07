import 'package:currency/src/features/converting/data/repositories/currencies_repository.dart';
import 'package:currency/src/features/converting/domain/entity/currency.dart';
import 'package:flutter/foundation.dart';

class CurrenciesVm with ChangeNotifier {
  CurrenciesVm(this._repository);

  final CurrenciesRepository _repository;

  bool _isLoading = false;
  List<Currency> _currencies = [];

  bool get isLoading => _isLoading;
  List<Currency> get currencies => _currencies;

  Future<void> fetchCurrencies() async {
    _isLoading = true;
    notifyListeners();
    _currencies = await _repository.getCurrencies();
    _isLoading = false;
    notifyListeners();
  }
}
