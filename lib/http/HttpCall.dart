import 'package:dio/dio.dart';

import '../models/UserDetails.dart';

class Http {
  // <List<Map<String,dynamic>>>
  Future getData() async {
    Response response;
    var http = Dio();
    response = await http.get("https://reqres.in/api/users?page=2");
    return response.data['data'];
  }
}

void main() async {
  var call = Http();
  var data = await call.getData();
  List res = [];
  for (var i in data) {
    res.add(UserDetails.fromJson(i));
  }
  print(res.toString());
}
