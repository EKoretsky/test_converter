import 'package:currency/src/features/converting/data/models/convert_rate_model.dart';
import 'package:currency/src/features/converting/data/models/currency_model.dart';
import 'package:dio/dio.dart';

abstract class ICurrenciesDataSource {
  ICurrenciesDataSource(this._dio);

  final Dio _dio;

  Future<ConvertRateModel> fetchRate(
      {required String base, required String currency});

  Future<List<CurrencyModel>> getCurrencies();
}

class CurrenciesDataSource extends ICurrenciesDataSource {
  CurrenciesDataSource(super.dio);

  @override
  Future<ConvertRateModel> fetchRate({
    required String currency,
    String? base,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/latest',
      queryParameters: {
        'type': 'fiat',
        'currencies': currency,
        if (base != null) 'base_currency': base
      },
    );
    final data = response.data!['data'] as Map<String, dynamic>;
    final map = data.map((key, value) {
      return MapEntry(key, ConvertRateModel.fromMap(value));
    });
    return map[currency]!;
  }

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/currencies',
      queryParameters: {'type': 'fiat'},
    );
    final data = response.data!['data'] as Map<String, dynamic>;
    final modelsMap = data.map((key, value) {
      return MapEntry(key, CurrencyModel.fromMap(value));
    });
    return List<CurrencyModel>.of(modelsMap.values);
  }
}
