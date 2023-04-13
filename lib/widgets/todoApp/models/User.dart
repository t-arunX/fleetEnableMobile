class User {
  int? id;
  String? email;
  String? password;

  // User({
  //   this.id,
  //   required this.email,
  //   required this.password
  // });

  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, password: $password}';
  }
}
