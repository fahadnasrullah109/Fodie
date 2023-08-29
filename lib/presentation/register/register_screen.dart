import 'package:flutter/material.dart';
import 'package:fodei/components/green_button.dart';
import 'package:fodei/components/icon_gray_button.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: const Color.fromARGB(255, 55, 65, 81),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  hintText: 'Enter you full name',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid full name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Email address',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: const Color.fromARGB(255, 55, 65, 81),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  hintText: 'Eg name@email.com',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Password',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: const Color.fromARGB(255, 55, 65, 81),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  hintText: '********',
                ),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              GreenButton(onTap: () {}, title: 'Registration'),
              const SizedBox(
                height: 8.0,
              ),
              IconGrayButton(onTap: () {}, title: 'Sign up with Google')
            ],
          ),
        ),
      ),
    );
  }
}
