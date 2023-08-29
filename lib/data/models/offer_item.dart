class OfferItem {
  String title;
  String description;
  String image;
  String background;
  String companyLogo;

  OfferItem(this.title, this.description, this.image, this.background,
      this.companyLogo);

  factory OfferItem.fromJson(Map<String, dynamic> json) => OfferItem(
      json["title"] ?? "",
      json["description"] ?? "",
      json["image"] ?? "",
      json["background"] ?? "",
      json["company_logo"] ?? "");
}
