class Vendor {
  String id;
  String userId;
  String name;
  String contactInformation;
  String addressId;

  Vendor({
    required this.id,
    required this.userId,
    required this.name,
    required this.contactInformation,
    required this.addressId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'contactInformation': contactInformation,
      'addressId': addressId,
    };
  }

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      contactInformation: json['contactInformation'],
      addressId: json['addressId'],
    );
  }
}