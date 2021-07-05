import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: use_key_in_widget_constructors
class CustomBottomSheet extends StatefulWidget {

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final buttonTextStyle = GoogleFonts.asap(
    textStyle: const TextStyle(
        fontSize: 17.0, color: Color(0xFF575757), fontWeight: FontWeight.w600),
  );

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: deviceHeight * 0.3,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 2,
                width: 40,
                color: const Color(0xFFB9B9B9),
              ),
            ),
            SizedBox(
              height: 44,
              width: deviceWidth * 0.8,
              child: ElevatedButton.icon(
                icon: Image.asset(
                  "assets/images/google.png",
                  height: 30,
                ),
                label: Text(
                  "Continue with Google",
                  style: buttonTextStyle,
                ),
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(
                      Colors.black),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(
                      const Color(0xFFFFFFFF)),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),
                ),
                onPressed: () {
                },
              ),
            ),
            SizedBox(
              height: 44,
              width: deviceWidth * 0.8,
              child: ElevatedButton.icon(
                  icon: Image.asset(
                    "assets/images/Facebook.png",
                    height: 30,
                  ),
                  label: Text(
                    "Continue with Facebook",
                    style: buttonTextStyle,
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(
                        Colors.black),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(
                        const Color(0xFFFFFFFF)),
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        )),
                  ),
                  onPressed: () {

                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                  "By selecting one or the other, you are agreeing to the\n",
                  style: GoogleFonts.asap(
                    textStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF767676),
                        fontWeight: FontWeight.w500),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms of Services',
                      style: GoogleFonts.asap(
                        textStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF65b3f8),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextSpan(
                      text: ' & ',
                      style: GoogleFonts.asap(
                        textStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF767676),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: GoogleFonts.asap(
                        textStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF65b3f8),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
