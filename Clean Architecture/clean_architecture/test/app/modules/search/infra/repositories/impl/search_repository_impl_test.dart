import 'package:clean_architecture/app/modules/search/dataSource/models/result_search_model.dart';
import 'package:clean_architecture/app/modules/search/dataSource/search_data_source.dart';
import 'package:clean_architecture/app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/infra/repositories/impl/search_repository_impl.dart';
import 'package:clean_architecture/app/modules/search/infra/repositories/search_repository.dart';
import 'package:clean_architecture/app/modules/search/shared/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_repository_impl.mocks.dart';

@GenerateMocks([SearchRepository, SearchDataSource])
main() {
  SearchRepository? repository;
  SearchDataSource? dataSource;

  group('SearchByText test', () {
    setUp(() {
      dataSource = MockSearchDataSource();
      repository = SearchRepositoryImpl(dataSource: dataSource!);
      when(dataSource!.getSearch(searchText: 'any')).thenAnswer(
          (realInvocation) async => <ResultSearchModel>[
                ResultSearchModel(
                    title: 'title', img: 'img', content: 'content')
              ]);
    });

    test('search should return a list of ResultSearch', () async {
      final result = await repository!.search(searchText: 'any');
      expect(result, isA<Right<FailureSearch, List<ResultSearch>>>());
    });
    test('search should return a error', () async {
      when(dataSource!.getSearch(searchText: 'any')).thenThrow(Exception());
      final result = await repository!.search(searchText: 'any');
      expect(result.fold(id, id), isA<DataSourceError>());
    });
    test('search should return a error if is empty', () async {
      when(dataSource!.getSearch(searchText: 'any'))
          .thenAnswer((realInvocation) async => <ResultSearchModel>[]);
      final result = await repository!.search(searchText: 'any');
      expect(result.fold(id, id), isA<DataSourceEmptyError>());
    });
  });
}
