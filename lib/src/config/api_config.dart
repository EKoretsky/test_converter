import 'package:dio/dio.dart';

abstract class _ApiConfig {
  static const apiKey = 'cur_live_iDz7rGjwEyz22krDxaZZ0wt7uutsQDG0TqbpIux9';
  static const baseUrl = 'https://api.currencyapi.com/v3/';
}

final dioConfig = Dio(
  BaseOptions(
    baseUrl: _ApiConfig.baseUrl,
    headers: {
      'apiKey': _ApiConfig.apiKey,
    },
  ),
);
