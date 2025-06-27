class User {
  String id;
  String email;
  String password;
  String role;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
  });

  // Convert a User object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  // Create a User object from a Map object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
    );
  }
}