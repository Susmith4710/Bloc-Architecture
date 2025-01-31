import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latest_bloc_api_calling/user.dart';
//import 'package:latest_bloc_api_calling/main.dart';
import 'main.dart';
import 'main2.dart';
import 'network_router.dart';


 class NetworkManager{
Future<List<User>> fetchUsersFromAPI() async {
  try {
    final response = await http.get(NetworkRouter.getSelectedSchemeDetail());
   // print(response.body);
    List responseJson = json.decode(response.body.toString());
    print("This is string response $responseJson");
    List<User> userList = createUserList(responseJson);
   // print(userList);
    return userList;
  } catch (e) {
    rethrow;
  }
}

}