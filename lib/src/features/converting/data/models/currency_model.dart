class CurrencyModel {
  CurrencyModel({
    required this.code,
    required this.name,
  });

  final String code;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      code: map['code'] as String,
      name: map['name'] as String,
    );
  }

  @override
  String toString() => 'CurrencyModel{code: $code, name: $name}';
}