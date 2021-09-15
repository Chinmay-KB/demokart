class User {
  User({
    required this.email,
    required this.name,
    required this.cart,
  });

  String email;
  String name;
  List<String> cart;

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"] as String,
        name: json["name"] as String,
        cart: List<String>.from(json["cart"].map((x) => x) as Iterable<String>),
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "cart": List<dynamic>.from(cart.map((x) => x)),
      };
}
