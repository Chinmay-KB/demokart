class Product {
  Product(
      {required this.about,
      required this.category,
      required this.description,
      required this.discount,
      required this.imgUrl,
      required this.name,
      required this.price,
      required this.productId,
      required this.sellerName,
      required this.listCategory});

  List<String> about;
  String category;
  String description;
  double discount;
  String imgUrl;
  String name;
  double price;
  String productId;
  String sellerName;
  List<String> listCategory;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        about:
            List<String>.from(json["about"].map((x) => x) as Iterable<dynamic>),
        listCategory: List<String>.from(
            json["list_category"].map((x) => x) as Iterable<dynamic>),
        category: json["category"] as String,
        description: json["description"] as String,
        discount: json["discount"].toDouble() as double,
        imgUrl: json["img_url"] as String,
        name: json["name"] as String,
        price: json["price"].toDouble() as double,
        productId: json["product_id"] as String,
        sellerName: json["seller_name"] as String,
      );

  Map<String, dynamic> toMap() => {
        "about": List<dynamic>.from(about.map((x) => x)),
        "category": category,
        "description": description,
        "discount": discount,
        "img_url": imgUrl,
        "name": name,
        "price": price,
        "product_id": productId,
        "seller_name": sellerName,
        "list_category": listCategory
      };
}
