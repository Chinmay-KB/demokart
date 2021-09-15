// To parse this JSON data, do
//
//     final carousel = carouselFromMap(jsonString);

class Carousel {
  Carousel({
    required this.items,
  });

  List<Item> items;

  factory Carousel.fromMap(Map<String, dynamic> json) => Carousel(
        items: List<Item>.from(json["items"]!
            .map((x) => Item.fromMap(x as Map<String, dynamic>)) as Iterable),
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Item {
  Item(
      {required this.text,
      required this.imageUrl,
      required this.onClick,
      required this.color});

  String text;
  String imageUrl;
  String onClick;
  String color;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
      text: json["text"]! as String,
      imageUrl: json["image_url"]! as String,
      onClick: json["on_click"]! as String,
      color: json['color']! as String);

  Map<String, dynamic> toMap() => {
        "text": text,
        "image_url": imageUrl,
        "on_click": onClick,
        "color": color
      };
}
