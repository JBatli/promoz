class Promotion {
  final String id;
  final String offeringId;
  final String code;
  final String description;
  final String discountType;
  final double discountValue;
  final DateTime startDate;
  final DateTime endDate;

  Promotion({
    required this.id,
    required this.offeringId,
    required this.code,
    required this.description,
    required this.discountType,
    required this.discountValue,
    required this.startDate,
    required this.endDate,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'],
      offeringId: json['offeringId'],
      code: json['code'],
      description: json['description'],
      discountType: json['discountType'],
      discountValue: json['discountValue'].toDouble(),
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'offeringId': offeringId,
      'code': code,
      'description': description,
      'discountType': discountType,
      'discountValue': discountValue,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}