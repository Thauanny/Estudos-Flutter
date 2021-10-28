import 'package:clean_architecture/app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/infra/repositories/search_repository.dart';
import 'package:clean_architecture/app/modules/search/shared/errors/errors.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      {required String searchText}) {}
}
