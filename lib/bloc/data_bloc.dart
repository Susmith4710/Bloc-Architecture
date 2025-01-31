
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_bloc_api_calling/network_manager.dart';

import '../user.dart';



part 'data_event.dart';
part 'data_state.dart';



class DisplayBloc extends Bloc<DisplayEvent, DisplayState>{

  User? user;

DisplayBloc() : super(DisplayLoadInitial()){
on<DisplayEvent>(((event, emit) async {
  print(event.runtimeType);
//(event is DisplayInitEvent);
    emit(DisplayLoadInitial());
   final response=NetworkManager().fetchUsersFromAPI;
     await Future.delayed(Duration(seconds: 5));

    emit(DisplayLoaded(user: user!));
    print("Display init event is initialized");

    
  
  
  // else if(event is DisplayInitEvent){

  //   print("api is loaded");
  //  print("this api has been called here");
  // emit(DisplayLoadInitial());
  // }
}));
}
}




