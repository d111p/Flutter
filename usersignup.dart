class UserSignupModel {
  final username;
  final password;
  final password2;
  final email;
  final first_name;
  final last_name;
  final is_staff;

  UserSignupModel(
      {required this.username,
      required this.password,
      required this.password2,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.is_staff});

  factory UserSignupModel.fromJson(Map<String, dynamic> json) {
    return UserSignupModel(
        username: json['username'],
        password: json['password'],
        password2: json['password2'],
        email: json['email'],
        first_name: json['firstName'],
        last_name: json['lastName'],
        is_staff: json["is_staff"]);
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'password2': password2,
        'email': email,
        'first_name': first_name,
        'last_name': last_name,
        'is_staff': is_staff,
      };
}
