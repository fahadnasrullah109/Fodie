import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodei/components/logout_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const SizedBox(
            height: 10,
          ),
          Card(
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/ic_user.png',
                    ),
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fahad Nasrullah',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 31, 41, 55),
                              fontSize: 18),
                        ),
                        Text(
                          'fahad.nasrullah109@gmail.com',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 107, 114, 128),
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            const Color.fromARGB(255, 243, 243, 243),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              const Color.fromARGB(255, 243, 243, 243),
                          child: SvgPicture.asset(
                              'assets/images/ic_notification.svg'),
                        ),
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: const Color(0xffF24F4F),
                        child: Text(
                          '3',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Card(
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/ic_account.svg"),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      'Account Setting',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 31, 41, 55),
                          fontSize: 18),
                    ),
                  ),
                  SvgPicture.asset("assets/images/ic_account_settings_edit.svg")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Card(
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/ic_language.svg"),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              'Language',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 31, 41, 55),
                                  fontSize: 18),
                            ),
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/ic_feedback.svg"),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              'Feedback',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 31, 41, 55),
                                  fontSize: 18),
                            ),
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/ic_star.svg"),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              'Rate us',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 31, 41, 55),
                                  fontSize: 18),
                            ),
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/ic_new_version.svg"),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              'New Version',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 31, 41, 55),
                                  fontSize: 18),
                            ),
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 100, child: LogoutButton(onTap: () {})),
            ],
          )
        ],
      ),
    );
  }
}
