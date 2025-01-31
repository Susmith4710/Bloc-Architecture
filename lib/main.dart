
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_bloc_api_calling/bloc/data_bloc.dart';
import 'package:latest_bloc_api_calling/user.dart';

import 'network_manager.dart';


void main() => runApp(const Display());

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final displayBloc = DisplayBloc();
  @override
  void initState() {
    super.initState();
    displayBloc.add(DisplayInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => displayBloc,
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
          title: const Text("This is NYC Data"),),
          body:BlocBuilder(bloc: displayBloc,buildWhen: (previous,current)
          =>current is DisplayLoadInitial,
          builder: (context,state){
          //  if (state is DisplayLoadInitial){
             // await Future.delayed(Duration(seconds: 2));

             // return const NycData();
              
           // }
            // else if(state is DisplayLoaded){
            //   return  const NycData();
            // }
            return Container();
          },
          )
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  CircularProgressIndicator(color: Colors.amber,);
    
  }
}

class NycData extends StatelessWidget {
  const NycData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(height: 200,width:300,color: Colors.red,
     child: FutureBuilder<List<User>>(future:NetworkManager().fetchUsersFromAPI(),
      builder: ((context, snapshot) {
        // if(snapshot.connectionState==ConnectionState.waiting){
        //    return const Center(child:CircularProgressIndicator(color: Colors.black,),);
        // }
        if(snapshot.hasData && snapshot.data!.isNotEmpty){
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             const Divider(),
                             Text(
                                  snapshot
                                      .data![index].new_york_city_population,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(snapshot.data![index].year,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  snapshot.data![index]
                                      .nyc_consumption_million_gallons_per_day,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ]);
                      });
                }else if (snapshot.hasError) {
                  return Text("$snapshot.error");
                }

        
      return const CircularProgressIndicator();
      })),
      
      );
  }
}

 databuild (DisplayState state){
  if(state is DisplayLoadInitial){
    return Loader;
  }
  else if(state is DisplayLoaded){
    return NycData;
  }
  return Loader;
}





List<User> createUserList(List data) {
  List<User> list = []..length;

  for (int i = 0; i < data.length; i++) {
    String title = data[i]["new_york_city_population"];
    String id = data[i]["year"];
    User user = User(
        new_york_city_population: title,
        year: id,
        nyc_consumption_million_gallons_per_day: '');
    list.add(user);
  }
  print("*************************");
 // print(list);
  return list;
}