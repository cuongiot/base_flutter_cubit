import 'dart:convert';

import 'package:dio/dio.dart';

class JsonResponseConverter extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is Map) {
    } else {
      response.data = json.decode(response.data);
    }
    super.onResponse(response, handler);
  }
}
