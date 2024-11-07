import 'package:currency/src/features/converting/data/remote/currencies_data_source.dart';
import 'package:currency/src/features/converting/domain/entity/currency.dart';
import 'package:currency/src/features/converting/domain/entity/rate.dart';
import 'package:currency/src/features/converting/domain/repositories/i_currencies_repository.dart';

final class CurrenciesRepository implements ICurrenciesRepository {
  CurrenciesRepository(this.dataSource);

  final ICurrenciesDataSource dataSource;

  @override
  Future<Rate> fetchRate(
      {required String baseCurrency, required String to}) async {
    final model =
        await dataSource.fetchRate(baseCurrency: baseCurrency, to: to);
    return Rate(code: model.code, value: model.value);
  }

  @override
  Future<List<Currency>> getCurrencies() async {
    final models = await dataSource.getCurrencies();
    return models.map((e) {
      return Currency(name: e.name, code: e.code);
    }).toList();
  }
}
