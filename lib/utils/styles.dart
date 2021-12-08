import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/utils/colors.dart';

final AppBarTitleTextStyle = GoogleFonts.montserrat(
  fontSize: 20,
);

final HeaderTextStyle = GoogleFonts.montserrat(
  fontSize: 40,
  fontWeight: FontWeight.w900,
  color: AppColors.buttonColor1,
);

final ButtonTextStyle = GoogleFonts.montserrat(
  fontSize: 20,
  color: Colors.white,
);

final SubTextStyle = GoogleFonts.montserrat(
  color: Colors.black.withOpacity(0.5),
  fontSize: 16.0,
);

final onboardingPageTextStyle = TextStyle(
  fontSize: 25,
    fontWeight: FontWeight.w500,
);

final onboardingPageSubTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w300,
);

final welcomePageTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 45,
    fontWeight: FontWeight.bold,
);