class Booking {
  String id;
  String customerId;
  String offeringId;
  String vendorId;
  DateTime bookingDate;
  String status;
  double totalPrice;

  Booking({
    required this.id,
    required this.customerId,
    required this.offeringId,
    required this.vendorId,
    required this.bookingDate,
    required this.status,
    required this.totalPrice,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      customerId: json['customerId'],
      offeringId: json['offeringId'],
      vendorId: json['vendorId'],
      bookingDate: DateTime.parse(json['bookingDate']),
      status: json['status'],
      totalPrice: json['totalPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'offeringId': offeringId,
      'vendorId': vendorId,
      'bookingDate': bookingDate.toIso8601String(),
      'status': status,
      'totalPrice': totalPrice,
    };
  }
}