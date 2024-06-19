class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.id, required this.name, required this.imageUrl, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      price: json['price'].toDouble(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode ^ price.hashCode;

}
