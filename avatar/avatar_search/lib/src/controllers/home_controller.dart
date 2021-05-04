import '../models/avatar_model.dart';
import '../repositories/avatar_respository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<AvatarModel> avatars = [];
  List<AvatarModel> allchars = [];
  final AvatarRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([AvatarRepository repository])
      : _repository = repository ?? AvatarRepository(null);

  Future start() async {
    state.value = HomeState.loading;
    try {
      avatars = await _repository.fetchAvatars();
      allchars = await _repository.fetchAllchars();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, sucess, error }
