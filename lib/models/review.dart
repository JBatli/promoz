class Review {
  String id;
  String customerId;
  String offeringId;
  double rating;
  String comment;
  DateTime reviewDate;

  Review({
    required this.id,
    required this.customerId,
    required this.offeringId,
    required this.rating,
    required this.comment,
    required this.reviewDate,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      offeringId: json['offeringId'] as String,
      rating: json['rating'] as double,
      comment: json['comment'] as String,
      reviewDate: DateTime.parse(json['reviewDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'offeringId': offeringId,
      'rating': rating,
      'comment': comment,
      'reviewDate': reviewDate.toIso8601String(),
    };
  }
}