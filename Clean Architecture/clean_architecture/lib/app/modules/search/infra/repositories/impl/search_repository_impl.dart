import 'package:clean_architecture/app/modules/search/dataSource/search_data_source.dart';
import 'package:clean_architecture/app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/infra/repositories/search_repository.dart';
import 'package:clean_architecture/app/modules/search/shared/errors/errors.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl({required this.dataSource});

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      {required String searchText}) async {
    try {
      final result = await dataSource.getSearch(searchText: searchText);
      if (result.isEmpty) return Left(DataSourceEmptyError());
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
