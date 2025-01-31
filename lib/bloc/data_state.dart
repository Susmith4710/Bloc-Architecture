part of 'data_bloc.dart';
@immutable
abstract class DisplayState{}

class DisplayLoadInitial extends DisplayState{}

class DisplayLoaded extends DisplayState{
  late User user;
  DisplayLoaded({required this.user});
}

class DisplayLoadingFailed extends DisplayState{}class DisplayLoadInitial extends DisplayState {
  const DisplayLoadInitial();
}

class DisplayLoaded extends DisplayState {
  final User user;

  const DisplayLoaded({required this.user});
}

class DisplayLoadingFailed extends DisplayState {
  final String? errorMessage;

  const DisplayLoadingFailed({this.errorMessage});
}