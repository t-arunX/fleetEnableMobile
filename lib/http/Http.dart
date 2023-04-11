import 'package:dio/dio.dart';

import '../models/UserDetails.dart';

class Http {
  // <List<Map<String,dynamic>>>
  Future httpCall() async {
    Response response;
    var http = Dio();
    response = await http.get("https://reqres.in/api/users?page=2");
    return response.data['data'];
  }

  Future<String> getData() async {
    var call = Http();
    var data = await call.httpCall();
    List res = [];
    for (var i in data) {
      res.add(UserDetails.fromJson(i));
    }
    return res.toString();
  }
}

// void main() async {
//   var call = Http();
//   var data = await call.getData();
//   List res = [];
//   for (var i in data) {
//     res.add(UserDetails.fromJson(i));
//   }
//   print(res.toString());
// }
