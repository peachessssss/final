import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextFormField tff1 = TextFormField(
  decoration: InputDecoration(
      border: InputBorder.none,
      hintText: "Email",
      hintStyle: GoogleFonts.mitr(fontSize: 20, color: Colors.grey)),
  keyboardType: TextInputType.emailAddress,
);
