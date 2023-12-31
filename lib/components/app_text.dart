import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static final mainTitleTextStyle = GoogleFonts.getFont(
    'Oswald',
    color: Colors.black,
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );
  static final titleTextStyle = GoogleFonts.getFont(
    'Oswald',
    color: Colors.black,
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );

  static final bodyTextStyle = GoogleFonts.getFont(
    'Montserrat',
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final descritionTextStyle = GoogleFonts.getFont(
    'Montserrat',
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final dataColumnText = GoogleFonts.getFont(
    'Oswald',
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final redBookTitleText = GoogleFonts.montserratAlternates(
    fontSize: 24,
    color: const Color(0xff232828),
    fontWeight: FontWeight.w700,
  );

  static final redBookBodyText = GoogleFonts.raleway(
    fontSize: 18,
    color: const Color(0xff232828),
    fontWeight: FontWeight.w600,
  );
}
