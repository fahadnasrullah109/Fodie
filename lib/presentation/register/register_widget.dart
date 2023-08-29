import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodei/components/green_button.dart';
import 'package:fodei/components/login_button.dart';
import 'package:fodei/presentation/register/login_screen.dart';
import 'package:fodei/presentation/register/register_screen.dart';
import 'package:fodei/presentation/terms/privacy_policy.dart';
import 'package:fodei/presentation/terms/terms_conditions.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  void showLoginSingupBottomSheet(BuildContext ctx, int selectedPage) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: ctx,
      builder: (ctx) => SizedBox(
        height: MediaQuery.of(context).copyWith().size.height * 0.80,
        child: DefaultTabController(
          initialIndex: selectedPage,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Create Account",
                  ),
                  Tab(
                    text: "Login",
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: <Widget>[
                RegisterScreen(),
                LoginScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/images/order_success.svg',
                  width: 200.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              textAlign: TextAlign.center,
              'Welcome',
              style: GoogleFonts.inter(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 31, 41, 55),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Before enjoying Foodmedia services,\nplease register first",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GreenButton(
                      onTap: () {
                        showLoginSingupBottomSheet(context, 0);
                      },
                      title: 'Create Account'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  LoginButton(onTap: () {
                    showLoginSingupBottomSheet(context, 1);
                  }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'By logging in or registering, you have agreed to the',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: ' Terms and Conditions ',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 50, 183, 104),
                            fontSize: 10.0,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TermsConditions(),
                                ),
                              );
                            },
                        ),
                        TextSpan(
                          text: ' And ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 50, 183, 104),
                            fontSize: 10.0,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicy(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
