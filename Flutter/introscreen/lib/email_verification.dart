import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

class MyApp1 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  /// The boolean to handle the dynamic operations
  bool submitValid = false;

  /// Text editing controllers to get the value from text fields
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();

  // Declare the object
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
  }

  void sendotp() async {
    emailAuth = EmailAuth(sessionName: 'Test Session');
    var res = await emailAuth.sendOtp(
        recipientMail: _emailcontroller.text, otpLength: 6);
    if (res) {
      print('success');
    } else {
      print("failure");
    }
  }

  void verifyotp() async {
    var res = emailAuth.validateOtp(
        recipientMail: _emailcontroller.text, userOtp: _otpcontroller.text);
    if (res) {
      print('Success otp');
    } else {
      print('Fail otp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Email Auth sample'),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Center(
              child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _emailcontroller,
                ),
                Card(
                  margin: EdgeInsets.only(top: 20),
                  elevation: 6,
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.green[400],
                    child: GestureDetector(
                      onTap: () {
                        sendotp();
                      },
                      child: const Center(
                        child: Text(
                          "Request OTP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// A dynamically rendering text field
                (submitValid)
                    ? TextField(
                        controller: _otpcontroller,
                      )
                    : Container(height: 1),
                (submitValid)
                    ? Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 50,
                        width: 200,
                        color: Colors.green[400],
                        child: GestureDetector(
                          onTap: () {
                            verifyotp();
                          },
                          child: Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(height: 1)
              ],
            ),
          )),
        ),
      ),
    );
  }
}
