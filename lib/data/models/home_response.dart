import 'package:fodei/data/models/food_item.dart';
import 'package:fodei/data/models/offer_item.dart';
import 'package:fodei/data/models/resturant.dart';

class HomeResponse {
  List<OfferItem> offers;
  List<FoodItem> foods;
  List<Resturant> resturants;
  HomeResponse(this.offers, this.foods, this.resturants);

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
      List<OfferItem>.from(
        json["offers"].map(
          (x) => OfferItem.fromJson(x),
        ),
      ),
      List<FoodItem>.from(
        json["new_arrival"].map(
          (x) => FoodItem.fromJson(x),
        ),
      ),
      List<Resturant>.from(
        json["resturants"].map(
          (x) => Resturant.fromJson(x),
        ),
      ));
}
