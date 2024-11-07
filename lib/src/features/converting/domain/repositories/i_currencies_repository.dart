abstract interface class ICurrenciesRepository {
  void fetchRate({required String to, required String baseCurrency});

  void getCurrencies() {}
}
