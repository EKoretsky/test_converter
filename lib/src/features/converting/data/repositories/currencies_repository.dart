import 'package:currency/src/features/converting/data/models/convert_rate_model.dart';
import 'package:currency/src/features/converting/data/models/currency_model.dart';
import 'package:currency/src/features/converting/data/remote/currencies_data_source.dart';
import 'package:currency/src/features/converting/domain/entity/currency.dart';
import 'package:currency/src/features/converting/domain/entity/rate.dart';
import 'package:currency/src/features/converting/domain/repositories/i_currencies_repository.dart';

final class CurrenciesRepository implements ICurrenciesRepository {
  CurrenciesRepository(this.dataSource);

  final ICurrenciesDataSource dataSource;

  @override
  Future<Rate> fetchRate({required String base, required String to}) async {
    final model = await dataSource.fetchRate(
      base: base,
      currency: to,
    );
    return model.toRate();
  }

  @override
  Future<List<Currency>> getCurrencies() async {
    final models = await dataSource.getCurrencies();
    return models.map((model) => model.toCurrency()).toList();
  }
}
