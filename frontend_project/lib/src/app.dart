import 'package:flutter/material.dart';
import 'package:frontend_project/src/screen/tapbarPage/feedPage.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.nanumGothic().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: Feedpage(),
    );
  }
}
