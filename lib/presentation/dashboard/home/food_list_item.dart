import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodei/data/models/food_item.dart';
import 'package:fodei/data/remote/network/api_end_points.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, required this.food});
  final FoodItem food;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        surfaceTintColor: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  ApiEndPoints().getImageUrl(food.image),
                  width: 180.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                food.title,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 31, 41, 55),
                    fontSize: 18),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/images/ic_map.svg"),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Expanded(
                    child: Text(
                      food.location,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
