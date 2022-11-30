class Product {
  int? id;
  final String name;
  final String category;
  final double price;
  final int quantity;
  final int discount;
  final String description;

  Product({
    this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'],
      quantity: json['quantity'],
      discount: json['discount'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category,
        'price': price,
        'quantity': quantity,
        'discount': discount,
        'description': description,
      };
}
