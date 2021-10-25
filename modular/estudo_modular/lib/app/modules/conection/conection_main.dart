import 'package:dio/dio.dart';
import 'package:estudo_modular/app/modules/conection/repository/repository.dart';

main() async {
  final product = Product(DioImp());

  final list = await product.fecthProducts();
}

class Product {
  ConnectionRepository? _repository;

  Product(ConnectionRepository repository) {
    _repository = repository;
  }

  Future<List> fecthProducts() async {
    final response = await _repository!.fecthProducts('path');
    return response.data;
  }
}
