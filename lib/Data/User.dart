import 'dart:convert';


abstract class Address {
  late String dno;
  late String city;
  late String zipCode;
  late String state;
  late String country;

  // Address(this.dno);
}

class User extends Address {
  int id;
  String name;
  @override
  String dno;
  @override
  String city;
  @override
  String zipCode;
  @override
  String state;
  @override
  String country;


  User({
        required this.id,
        required this.name,
        required this.dno,
        required this.city,
        required this.zipCode,
        required this.state,
        required this.country
      });

  // User(
  //    this.id,
  //   [ this.name,
  //    this.dno,
  //    this.city,
  //    this.zipCode,
  //    this.state,
  //    this.country
  // ]);

  Map toJson() => {
        'id': id,
        'name': name,
        'Address': {
          'dno': dno,
          'city': city,
          'zipCode': zipCode,
          'State': state,
          'country': country
        }
      };

  @override
  int? getId() {
    return id;
  }

  @override
  String? getName() {
    return name;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name,'
        ' dno: $dno, city: $city,'
        ' zipCode: $zipCode, State: $state,'
        ' country: $country}';
  }
}
class Person{
  String name;
  int id;

  Person(this.name, this.id);

  Map toJson() =>{
    'id':id,
    'name':name
  };
}

void main() {
  var l2 = User(id: 20, name: "surya",dno: '23/34',
      city: "vizag",state:'AP',
      zipCode: '123',country: "USA");
  var l1 = User(id: 20, name: "surya",dno: '23/34',
      city: "vizag",state:'AP',
      zipCode: '123',country: "USA");
  // var js = [l1,l2];
  // print(js);
  // print(data);
  String res1 = jsonEncode(l1);
  String res2 = jsonEncode(l2);
  List data = [res1,res2];
  // print(data);
  // print(jsonStu);
  // List jsonfile = json.decode(js.toString());
  // print(jsonfile);
  var mappedData = data.map((e){
    // print(e);
    return e['name'];
  });
}
