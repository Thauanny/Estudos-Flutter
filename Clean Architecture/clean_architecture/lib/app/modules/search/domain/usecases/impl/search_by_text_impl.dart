import 'package:clean_architecture/app/modules/search/domain/entities/result_search.dart';

import 'package:clean_architecture/app/modules/search/infra/repositories/search_repository.dart';
import 'package:clean_architecture/app/modules/search/shared/errors/errors.dart';
import 'package:dartz/dartz.dart';

import '../search_by_text.dart';

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl({required this.repository});

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      {required String searchText}) async {
    if (searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return await repository.search(searchText: searchText);
  }
}
