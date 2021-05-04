import 'package:dio/dio.dart';

import '../models/avatar_model.dart';

class AvatarRepository {
  Dio dio;
  final avatars =
      'https://last-airbender-api.herokuapp.com/api/v1/characters/avatar';
  final allchars =
      'https://last-airbender-api.herokuapp.com/api/v1/characters?perPage=all';

  AvatarRepository(Dio client) : dio = client ?? Dio();

  Future<List<AvatarModel>> fetchAvatars() async {
    final response = await dio.get(avatars);
    final list = response.data as List;
    return list.map((json) => AvatarModel.fromJson(json)).toList();
  }

  Future<List<AvatarModel>> fetchAllchars() async {
    final response = await dio.get(allchars);
    final list = response.data as List;
    return list.map((json) => AvatarModel.fromJson(json)).toList();
  }
}
