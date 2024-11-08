import 'package:currency/src/features/converting/domain/entity/rate.dart';

class ConvertRateModel {
  ConvertRateModel({
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

  factory ConvertRateModel.fromMap(Map<String, dynamic> map) {
    late double val;
    if (map['value'] is int) {
      val = (map['value'] as int).toDouble();
    } else {
      val = map['value'] as double;
    }
    return ConvertRateModel(
      code: map['code'] as String,
      value: val,
    );
  }

  @override
  String toString() => 'ConvertRate{code: $code, value: $value}';
}

extension ToRate on ConvertRateModel {
  Rate toRate() {
    return Rate(code: code, rate: value);
  }
}
