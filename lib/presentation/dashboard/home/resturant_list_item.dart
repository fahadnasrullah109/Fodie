import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodei/components/green_button.dart';
import 'package:fodei/data/models/resturant.dart';
import 'package:fodei/data/remote/network/api_end_points.dart';
import 'package:google_fonts/google_fonts.dart';

class ResturantListItem extends StatelessWidget {
  const ResturantListItem({super.key, required this.resturant});
  final Resturant resturant;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                ApiEndPoints().getImageUrl(resturant.gallery[0]),
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  resturant.name,
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
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/ic_map.svg"),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(resturant.location),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 35.0,
                      child: GreenButton(
                        onTap: () {},
                        title: 'Check',
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
