abstract interface class ICurrenciesRepository {
  void fetchRate({required String to, required String base});

  void getCurrencies();
}
