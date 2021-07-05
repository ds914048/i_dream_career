import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_dream_career/screens/otp_screen.dart';
import 'package:i_dream_career/widgets/bottom_sheet.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
   // ignore: use_key_in_widget_constructors
   const SignIn({this.onPressBackButton});
  // ignore: prefer_typing_uninitialized_variables
  final onPressBackButton;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool error = false;

  final buttonTextStyle = GoogleFonts.asap(
    textStyle: const TextStyle(
        fontSize: 17.0, color: Color(0xFF575757), fontWeight: FontWeight.w600),
  );

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          color: Colors.grey[700],
          onPressed: widget.onPressBackButton,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: deviceHeight,
          width: deviceWidth,
          child: Padding(
            padding: const EdgeInsets.all(41.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  "Enter your ",
                  style: GoogleFonts.asap(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: Color(0xFF65b3f8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Mobile number ",
                  style: GoogleFonts.asap(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 27.0,
                      color: Color(0xFF4A4A4A),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  "we will send you a One Time Password (OTP)",
                  style: GoogleFonts.asap(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: Color(0xFFA3A4A6),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 25),
                      child: Text(
                        "+91",
                        style: GoogleFonts.asap(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 23.0,
                            color: Color(0xFFA4A4A4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.3,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: phone,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:error?Colors.red: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:error?Colors.red: const Color(0xFF65b3f8)),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            // border: InputBorder.none,
                            errorStyle: const TextStyle(height: 0, fontSize: 14),
                            hintText: "Enter here",
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey[300]),
                          ),
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                          ),

                        ),
                      ),
                    ),
                  ],
                ),

                error ? SizedBox(
                        height: deviceHeight * 0.2,
                        width: deviceWidth,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF65B2A).withOpacity(0.11),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6))),
                            height: 40,
                            width: deviceWidth * 0.45,
                            child: Center(
                              child: Text(
                                "Please Enter a valid mobile number",
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
                        ),
                      )
                    : loading
                        ? SizedBox(
                            height: deviceHeight * 0.2,
                            width: deviceWidth,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Lottie.asset(
                                    'assets/images/loading.json',
                                    width: 120,
                                    height: 55,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: deviceHeight * 0.2,
                            width: deviceWidth,
                            child: Center(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xFF65b3f8),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (phone.text.length != 10) {
                                      setState(() {
                                        error = true;
                                      });
                                      showError();
                                    } else {
                                      setState(() {
                                        loading = true;
                                      });
                                      loadData();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                Center(
                  child: Image.asset(
                    "assets/images/phone.png",
                    height: deviceHeight * 0.3,
                  ),
                ),

              ],
            ),
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
    return Timer(const Duration(seconds: 4), onDoneLoading);
  }

  onDoneLoading() {
    setState(() {
      loading = false;
    });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) =>  OtpScreen(number: phone.text,)));
  }

  Future<Timer> showError() async {
    return Timer(const Duration(seconds: 3), onDoneShowError);
  }

  onDoneShowError() {
    setState(() {
      error = false;
    });
  }


}
