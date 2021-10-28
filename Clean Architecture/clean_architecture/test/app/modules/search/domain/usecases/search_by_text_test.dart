import 'package:clean_architecture/app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/domain/usecases/impl/search_by_text_impl.dart';
import 'package:clean_architecture/app/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_architecture/app/modules/search/infra/repositories/search_repository.dart';
import 'package:clean_architecture/app/modules/search/shared/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_by_text_test.mocks.dart';

@GenerateMocks([SearchRepository])
main() {
  SearchByText? useCase;
  SearchRepository? repository;

  group('SearchByText test', () {
    setUp(() {
      repository = MockSearchRepository();
      useCase = SearchByTextImpl(repository: repository!);

      when(repository!.search(searchText: 'Thauanny')).thenAnswer((_) async =>
          Right(<ResultSearch>[
            ResultSearch(title: 'title', img: 'img', content: 'content')
          ]));
    });

    test('call should return a list of ResultSearch', () async {
      final result = await useCase!.call(searchText: 'Thauanny');

      expect(result, isA<Right<FailureSearch, List<ResultSearch>>>());
    });
    test('call should return a Exception', () async {
      final dynamic result = await useCase!.call(searchText: '');

      expect(result, isA<Left<FailureSearch, List<ResultSearch>>>());
    });
  });
}
