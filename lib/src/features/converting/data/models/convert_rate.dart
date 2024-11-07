class ConvertRate {
  ConvertRate({
    required this.code,
    required this.value,
  });

  final String code;
  final double value;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'value': value,
    };
  }

  factory ConvertRate.fromMap(Map<String, dynamic> map) {
    late double val;
    if (map['value'] is int) {
      val = (map['value'] as int).toDouble();
    } else {
      val = map['value'] as double;
    }
    return ConvertRate(
      code: map['code'] as String,
      value: val,
    );
  }

  @override
  String toString() => 'ConvertRate{code: $code, value: $value}';
}
