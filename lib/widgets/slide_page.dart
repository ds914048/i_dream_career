
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SlidePage({
    this.height = 55,
    this.width = 55,
    this.title = '',
    this.title2 = '',
    this.subTitle = '',
    this.bgColor = const Color(0xFFfbfcfe),
    required this.image,
    this.titleImage=const SizedBox(),
  });

  final double height;
  final double width;
  final String title;
  final String title2;
  final String subTitle;
  final Color bgColor;
  final Widget image;
  final Widget titleImage;


  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: widget.bgColor,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: widget.height * 0.1,
          ),
          widget.image,
          SizedBox(
            height: widget.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: GoogleFonts.roboto(textStyle:TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19.0,
                    color: widget.bgColor == const Color(0xFFfbfcfe)
                        ? const Color(0xFF65b3f8)
                        : Colors.white,
                  ),),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      widget.title2,
                      style: GoogleFonts.asap(textStyle:  const TextStyle(
                          fontSize: 40.0,
                          color: Color(0xFF3A342D),
                          fontWeight: FontWeight.bold),),

                    ),
                    widget.titleImage,

                  ],
                ),
                const SizedBox(height: 28.0),
                SizedBox(
                  width: widget.width * 0.55,
                  child: Text(
                      widget.subTitle,
                      style: GoogleFonts.roboto(textStyle:TextStyle(
                          color: widget.bgColor == const Color(0xFFfbfcfe)
                              ? const Color(0xFFA9A9A9)
                              : Colors.white,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 14.0
                      ),)
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

}