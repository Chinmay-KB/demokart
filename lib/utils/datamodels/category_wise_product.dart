// To parse this JSON data, do
//
//     final categoryWiseProducts = categoryWiseProductsFromMap(jsonString);

// CategoryWiseProducts categoryWiseProductsFromMap(String str) =>
//     CategoryWiseProducts.fromMap(json.decode(str));

// String categoryWiseProductsToMap(CategoryWiseProducts data) =>
//     json.encode(data.toMap());

class CategoryWiseProducts {
  CategoryWiseProducts({
    required this.products,
  });

  List<String> products;

  factory CategoryWiseProducts.fromMap(Map<String, dynamic> json) =>
      CategoryWiseProducts(
        products: List<String>.from(
            json["products"].map((x) => x) as Iterable<dynamic>),
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x)),
      };
}
