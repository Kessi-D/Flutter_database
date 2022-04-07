class User {
  int id;
  String first_name;
  String last_name;
  String user_password;
  String user_email;

  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.user_password,
    required this.user_email,
  });

  String get firstName => first_name;
  String get lastName => last_name;
  String get password => user_password;
  String get email => user_email;

  // factory User.fromMap(Map<String, dynamic> json) => User(
  //       id: json["id"],
  //       firstName: json["firstName"],
  //       username: json["username"],
  //       password: json["password"],
  //     );

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'firstname': firstName,
  //     'username': username,
  //     'password': password,
  //   };
  // }

  // @override
  // String toString() {
  //   return 'Dog{id: $id, firstname: $first_name, username: $last_name, password: $user_password}';
  // }
}
