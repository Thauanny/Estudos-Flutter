import 'package:dio/dio.dart';

abstract class ConnectionRepository {
  Future<Response> fecthProducts(String path);
}

class DioService implements ConnectionRepository {
  @override
  Future<Response> fecthProducts(String path) {
    return Dio().get(path);
  }
}
