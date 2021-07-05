import 'dart:async';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_dream_career/screens/feed.dart';
import 'package:i_dream_career/widgets/bottom_sheet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
   // ignore: use_key_in_widget_constructors
   const OtpScreen({required this.number});
final String number;
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp = TextEditingController();
  Color filedColor = const Color(0xFF58ABF9);
   int otpMatch=0;//0:inactive,1:match,2:mismatch

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          color: Colors.grey[700],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 57.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Text(
                "Enter OTP ",
                style: GoogleFonts.asap(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    color: Color(0xFF193853),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                "Please enter the verification code sent to "+widget.number,
                style: GoogleFonts.asap(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                    color: Color(0xFF999999),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.18,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PinCodeTextField(
                        controller: otp,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        animationDuration: const Duration(milliseconds: 300),
                        cursorColor: const Color(0xFF58ABF9),
                        pinTheme: PinTheme(
                            inactiveColor: const Color(0xFFC8C8C8),
                            activeColor: filedColor,
                            fieldWidth: 33),
                        keyboardType: TextInputType.number,
                        onCompleted: (value) {
                          setState(() {
                            if (value == "858585") {
                              filedColor = Colors.lightGreen;
                              otpMatch=1;
                              loadData();

                            } else {
                              setState(() {
                                filedColor = Colors.red;
                                otpMatch=2;
                              });
                            }
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            filedColor = const Color(0xFF58ABF9);
                            otpMatch=0;
                            // currentText = value;
                          });
                        },
                        appContext: context,
                      ),
                      otpMatch==1? Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF00BF86).withOpacity(0.11),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                          height: 40,
                          width: deviceWidth * 0.45,
                          child: Center(
                            child: Text(
                              "OTP Correct",
                              style: GoogleFonts.asap(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                  color: Color(0xFF00BF86),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ):otpMatch==2? Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFF65B2A).withOpacity(0.11),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                          height: 40,
                          width: deviceWidth * 0.45,
                          child: Center(
                            child: Text(
                              "OTP Incorrect",
                              style: GoogleFonts.asap(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                  color: Color(0xFFF65B2A),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ):const SizedBox(),


                    ],
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Center(
                child: ArgonTimerButton(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  minWidth: MediaQuery.of(context).size.width * 0.3,
                  highlightColor: Colors.transparent,
                  highlightElevation: 0,
                  roundLoadingShape: false,
                  splashColor: Colors.transparent,
                  onTap: (startTimer, btnState) {
                    if (btnState == ButtonState.Idle) {
                      startTimer(30);
                    }
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (context) =>  Feed()));
                  },
                  // initialTimer: 10,
                  child: Text(
                    "Resend OTP",
                    style: GoogleFonts.asap(
                      textStyle: const TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF58ABF9),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  loader: (timeLeft) {
                    return Row(
                      children: [
                        Text(
                          "Resend OTP in",
                          style: GoogleFonts.asap(
                            textStyle: const TextStyle(
                                fontSize: 11.0,
                                color: Color(0xFF999999),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          " 00:$timeLeft",
                          style: GoogleFonts.asap(
                            textStyle: const TextStyle(
                                fontSize: 11.0,
                                color: Color(0xFF58ABF9),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    );
                  },
                  borderRadius: 5.0,
                  color: Colors.transparent,
                  elevation: 0,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/Fingerprint.png",
                  height: deviceHeight * 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: const Color(0xFFF9FAFE),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38.0),
                      topRight: Radius.circular(38.0)),
                ),
                elevation: 20,
                barrierColor: const Color(0xFFE5E5E5).withOpacity(0.7),
                builder: (context) {
                  return CustomBottomSheet();
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "more login options",
                style: GoogleFonts.asap(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.0,
                    color: Color(0xFFA3A4A6),
                  ),
                ),
              ),
              const Icon(Icons.keyboard_arrow_up_rounded),
            ],
          ),
        ),
      ),
    );
  }
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() {
    setState(() {
      otpMatch = 0;
      filedColor = const Color(0xFF58ABF9);
    });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => const Feed()));
  }
}
