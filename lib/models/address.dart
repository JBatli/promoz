class Address {
  String id;
  String street;
  String city;
  String stateProvince;
  String postalCode;
  String country;

  Address({
    required this.id,
    required this.street,
    required this.city,
    required this.stateProvince,
    required this.postalCode,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      stateProvince: json['stateProvince'] as String,
      postalCode: json['postalCode'] as String,
      country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'city': city,
      'stateProvince': stateProvince,
      'postalCode': postalCode,
      'country': country,
    };
  }
}