import 'package:flutter/material.dart';
import 'package:fodei/components/green_button.dart';
import 'package:fodei/components/icon_gray_button.dart';
import 'package:fodei/presentation/dashboard/dashboard.dart';
import 'package:fodei/presentation/forgot_password/forgot_password_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
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
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 50, 183, 104),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              GreenButton(
                  onTap: () {
                    Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => const Dashboard(),
                      ),
                      (route) => false,
                    );
                  },
                  title: 'Login'),
              const SizedBox(
                height: 8.0,
              ),
              IconGrayButton(onTap: () {}, title: 'Login with Google')
            ],
          ),
        ),
      ),
    );
  }
}
