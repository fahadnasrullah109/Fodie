class FoodItem {
  String title;
  String location;
  String image;
  FoodItem(this.title, this.location, this.image);

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
      json["title"] ?? "", json["location"] ?? "", json["image"] ?? "");
}
