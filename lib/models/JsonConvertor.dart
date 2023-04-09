import 'dart:convert';

class JsonConvertor {
  String? _name;
  String? _profileImage;
  String? _character;
  String? _village;

  JsonConvertor(
      {required String? name,
      required String? profileImage,
      required String? character,
      required String? village}) {
    this._name = name;
    this._profileImage = profileImage;
    this._character = character;
    this._village = village;
  }

  String? get name => _name;

  set name(String? name) => _name = name;

  String? get profileImage => _profileImage;

  set profileImage(String? profileImage) => _profileImage = profileImage;

  String? get character => _character;

  set character(String? character) => _character = character;

  String? get village => _village;

  set village(String? village) => _village = village;

  JsonConvertor.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _profileImage = json['profileImage'];
    _character = json['character'];
    _village = json['village'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['profileImage'] = this._profileImage;
    data['character'] = this._character;
    data['village'] = this._village;
    return data;
  }

  @override
  String toString() {
    return '{_name: $_name, _profileImage: $_profileImage, _character: $_character, _village: $_village}';
  }
}

void main() {
  var data = '''
        [
              {
                "name": "Sasuke Uchiha ",
                "profileImage": "https://static.wikia.nocookie.net/naruto/images/2/21/Sasuke_Part_1.png/revision/latest/scale-to-width-down/300?cb=20170716092103",
                "character": "Depressed kid",
                "village": "Hidden Leaf village"
              },
              {
                "name": "naruto Uzumaki",
                "profileImage":"https://occ-0-1556-988.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABYxJFBDckfZw1YUEIPwyuIg43Kw_HUBLvnCcgdOlvvf5Nc90SF3HSAi5L8uLyBqjziKBY-kGD2wu2JAqVsdHVR0frb6qG26I_U5v.jpg?r=77f",
                "character": "knuckle head",
                "village": "Hidden Leaf village"
              },
              {
                "name": "naruto Uzumaki",
                "profileImage":"https://occ-0-1556-988.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABYxJFBDckfZw1YUEIPwyuIg43Kw_HUBLvnCcgdOlvvf5Nc90SF3HSAi5L8uLyBqjziKBY-kGD2wu2JAqVsdHVR0frb6qG26I_U5v.jpg?r=77f",
                "character": "knuckle head",
                "village": "Hidden Leaf village"
              },
              {
                "name": "naruto Uzumaki",
                "profileImage":"https://occ-0-1556-988.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABYxJFBDckfZw1YUEIPwyuIg43Kw_HUBLvnCcgdOlvvf5Nc90SF3HSAi5L8uLyBqjziKBY-kGD2wu2JAqVsdHVR0frb6qG26I_U5v.jpg?r=77f",
                "character": "knuckle head",
                "village": "Hidden Leaf village"
              }
      ]
        
  ''';
  var foo = jsonDecode(data);
  var list = [];
  for (var i in foo) {
    list.add(JsonConvertor.fromJson(i));
  }
  print(list.first);
}
