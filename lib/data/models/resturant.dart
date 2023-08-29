class Resturant {
  String name;
  String location;
  String timing;
  String website;
  double lat;
  double lng;
  List<String> gallery;
  Resturant(this.name, this.location, this.timing, this.website, this.lat,
      this.lng, this.gallery);

  factory Resturant.fromJson(Map<String, dynamic> json) => Resturant(
        json["name"] ?? "",
        json["location"] ?? "",
        json["timing"] ?? "",
        json["website"] ?? "",
        json["latitude"] ?? 0.0,
        json["longitude"] ?? 0.0,
        List<String>.from(
          json["gallery"].map((x) => x),
        ),
      );
}
