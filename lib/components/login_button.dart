import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 209, 250, 229),
        minimumSize: const Size.fromHeight(40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(
        'Login',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 50, 183, 104),
        ),
      ),
    );
  }
}
