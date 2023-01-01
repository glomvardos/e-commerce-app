class User {
  final int id;
  final String username, userRole, firstname, lastname, email;

  User({
    required this.id,
    required this.username,
    required this.userRole,
    required this.firstname,
    required this.lastname,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        userRole: json['user_role'],
        firstname: json['first_name'],
        lastname: json['last_name'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'user_role': userRole,
        'first_name': firstname,
        'last_name': lastname,
        'email': email,
      };

  @override
  String toString() {
    return 'User{id: $id, username: $username, userRole: $userRole, firstname: $firstname, lastname: $lastname, email: $email}';
  }
}
