class Rate {
  Rate({
    required this.code,
    required this.rate,
  });

  final String code;
  final double rate;

  @override
  String toString() => 'Rate{code: $code, value: $rate}';
}
