class VendorPreferences {
  String id;
  String vendorId;
  Map<String, dynamic> businessHours;
  String serviceArea;
  List<String> paymentMethods;

  VendorPreferences({
    required this.id,
    required this.vendorId,
    required this.businessHours,
    required this.serviceArea,
    required this.paymentMethods,
  });

  factory VendorPreferences.fromJson(Map<String, dynamic> json) {
    return VendorPreferences(
      id: json['id'],
      vendorId: json['vendorId'],
      businessHours: json['businessHours'],
      serviceArea: json['serviceArea'],
      paymentMethods: List<String>.from(json['paymentMethods']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vendorId': vendorId,
      'businessHours': businessHours,
      'serviceArea': serviceArea,
      'paymentMethods': paymentMethods,
    };
  }
}