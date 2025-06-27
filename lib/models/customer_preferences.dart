class CustomerPreferences {
  String id;
  String customerId;
  List<String> preferredCategories;
  Map<String, bool> communicationPreferences;

  CustomerPreferences({
    required this.id,
    required this.customerId,
    required this.preferredCategories,
    required this.communicationPreferences,
  });

  factory CustomerPreferences.fromJson(Map<String, dynamic> json) {
    return CustomerPreferences(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      preferredCategories: List<String>.from(json['preferredCategories'] as List),
      communicationPreferences: Map<String, bool>.from(json['communicationPreferences'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'preferredCategories': preferredCategories,
      'communicationPreferences': communicationPreferences,
    };
  }
}