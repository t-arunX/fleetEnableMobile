class UserDetails {
  late num id;
  late String email;
  late String firstName;
  late String lastName;
  late String avatar;

  UserDetails({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  UserDetails.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['avatar'] = avatar;
    return map;
  }

  @override
  String toString() {
    return '{id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar}';
  }
}
