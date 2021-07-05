import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Feed",
          style: GoogleFonts.asap(
            textStyle: const TextStyle(
                fontSize: 24.6,
                color: Color(0xFF4A4A4A),
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
