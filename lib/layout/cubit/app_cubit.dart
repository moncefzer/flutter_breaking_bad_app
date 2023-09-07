import 'package:breaking_bad_app/layout/cubit/app_state.dart';
import 'package:breaking_bad_app/models/character_model.dart';
import 'package:breaking_bad_app/shared/network/end_points.dart';
import 'package:breaking_bad_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<CharacterModel> allCharacters = [];

  void getAllCharacters() {
    emit(AppGetCharacterLoadingState());
    DioHelper.getData(url: CHARACTERS).then((value) {
      value.data.forEach((character) {
        allCharacters.add(CharacterModel.fromJson(character));
      });
      emit(AppGetCharacterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetCharacterErrorState(error.toString()));
    });
  }
}
