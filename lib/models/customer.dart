class Customer {
  String id;
  String userId;
  String name;
  String contactInformation;

  Customer({
    required this.id,
    required this.userId,
    required this.name,
    required this.contactInformation,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      contactInformation: json['contactInformation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'contactInformation': contactInformation,
    };
  }
}