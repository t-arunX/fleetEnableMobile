class UserProfile {
  late String _name;
  late String _profileImage;
  late String _character;
  late String _village;

  UserProfile(this._name, this._profileImage, this._character, this._village);

  String get village => _village;

  set village(String value) {
    _village = value;
  }

  String get character => _character;

  set character(String value) {
    _character = value;
  }

  String get profileImage => _profileImage;

  set profileImage(String value) {
    _profileImage = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}
