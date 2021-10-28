import 'package:clean_architecture/app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/shared/errors/errors.dart';

import 'package:dartz/dartz.dart';

//Note: depender de abstrações e não de implementações!
abstract class SearchByText {
  //dartz para forçar tratamentos de erros
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      {required String searchText});
}
