abstract class AppState {}

class AppInitialState extends AppState {}

class AppGetCharacterLoadingState extends AppState {}

class AppGetCharacterSuccessState extends AppState {}

class AppGetCharacterErrorState extends AppState {
  final String error;

  AppGetCharacterErrorState(this.error);
}
