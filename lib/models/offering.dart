class Offering {
  String id;
  String vendorId;
  String name;
  String description;
  double price;
  String category;
  bool availability;
  String duration;
  String location;

  Offering({
    required this.id,
    required this.vendorId,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.availability,
    required this.duration,
    required this.location,
  });

  factory Offering.fromJson(Map<String, dynamic> json) {
    return Offering(
      id: json['id'],
      vendorId: json['vendorId'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      availability: json['availability'],
      duration: json['duration'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vendorId': vendorId,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'availability': availability,
      'duration': duration,
      'location': location,
    };
  }
}