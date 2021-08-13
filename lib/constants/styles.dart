import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palletes {
  static const PrimaryColor = Color(0xFF1a95b0);
}

class TextStyles {
  static final titleNormalFontStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final boldFontStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}

class DokterTextStyles {
  static final namaDokterFontStyle = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final jabatanDokterFontStyle = GoogleFonts.montserrat(
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  static final ratingDokterFontStyle = GoogleFonts.montserrat(
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );
}
