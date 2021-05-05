//import 'dart:html';
import 'package:bloc/bloc.dart';

enum AppEvent { increment, decrement }

class AppBloc extends Bloc<AppEvent, int> {
  // event, state
  AppBloc() : super(0);

  @override
  Stream<int> mapEventToState(AppEvent event) async* {
    //transforma evento em estado // async* para indicar retorno multiplo

    if (event == AppEvent.increment) {
      yield state + 1;
    } else {
      yield state - 1;
    }
  }
}
