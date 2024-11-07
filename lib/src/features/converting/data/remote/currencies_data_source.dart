import 'package:currency/src/config/api_config.dart';
import 'package:currency/src/features/converting/data/models/convert_rate.dart';
import 'package:currency/src/features/converting/data/models/currency_model.dart';
import 'package:dio/dio.dart';
// cur_live_iDz7rGjwEyz22krDxaZZ0wt7uutsQDG0TqbpIux9

abstract class ICurrenciesDataSource {
  ICurrenciesDataSource(this._dio);

  final Dio _dio;

  Future<ConvertRate> fetchRate({required String to, String? baseCurrency});

  Future<List<CurrencyModel>> getCurrencies();
}

class CurrenciesDataSource extends ICurrenciesDataSource {
  CurrenciesDataSource(super.dio);

  @override
  Future<ConvertRate> fetchRate({
    required String to,
    String? baseCurrency,
  }) async {
    const base = ApiConfig.baseUrl;
    final response = await _dio.get<Map<String, dynamic>>(
      '$base/latest',
      options: Options(headers: ApiConfig.headers),
      queryParameters: {
        'type': 'fiat',
        'currencies': to,
        if (baseCurrency != null) 'base_currency': baseCurrency
      },
    );
    final data = response.data!['data'] as Map<String, dynamic>;
    final map = data.map((key, value) {
      return MapEntry(key, ConvertRate.fromMap(value));
    });
    return map[to]!;
  }

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    const base = ApiConfig.baseUrl;
    final response = await _dio.get<Map<String, dynamic>>(
      '$base/currencies',
      options: Options(headers: ApiConfig.headers),
      queryParameters: {'type': 'fiat'},
    );
    final data = response.data!['data'] as Map<String, dynamic>;
    final modelsMap = data.map((key, value) {
      return MapEntry(key, CurrencyModel.fromMap(value));
    });
    return List<CurrencyModel>.of(modelsMap.values);
  }
}
