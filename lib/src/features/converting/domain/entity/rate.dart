class Rate {
  Rate({
    required this.code,
    required this.value,
  });

  final String code;
  final double value;

  @override
  String toString() => 'Rate{code: $code, value: $value}';
}
