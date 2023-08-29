import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IconGrayButton extends StatelessWidget {
  const IconGrayButton({super.key, required this.onTap, required this.title});

  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        minimumSize: const Size.fromHeight(40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/images/ic_google.svg"),
          const SizedBox(
            width: 16.0,
          ),
          Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 55, 65, 81),
            ),
          ),
        ],
      ),
    );
  }
}
