import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodei/components/green_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late Widget selectedWidget;

  @override
  void initState() {
    selectedWidget = ChangePasswordWidget(onSuccess: showSuccessScreen);
    super.initState();
  }

  void showSuccessScreen() {
    setState(() {
      selectedWidget = ChangePasswordSuccessWidget(onSignIn: () {
        Navigator.of(context).pop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change New Password'),
      ),
      body: selectedWidget,
    );
  }
}

class ChangePasswordSuccessWidget extends StatelessWidget {
  const ChangePasswordSuccessWidget({super.key, required this.onSignIn});

  final Function() onSignIn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset('assets/images/ic_success.svg'),
              Text(
                'Success',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 55, 65, 81),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Congratulations your password has\nbeen changed',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 130, 130, 130),
                ),
              ),
            ],
          ),
        ),
        GreenButton(onTap: onSignIn, title: 'Sign in')
      ]),
    );
  }
}

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({super.key, required this.onSuccess});

  final Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            'Enter a different password with the previous',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 156, 163, 175),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            'New password',
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
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              hintText: '********',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'Confirm password',
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
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              hintText: '********',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid confirm password';
              }
              return null;
            },
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      GreenButton(onTap: onSuccess, title: 'Reset Password'))),
        ],
      ),
    );
  }
}
