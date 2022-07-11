import 'package:flutter/material.dart';
import 'package:introscreen/settings_makemytrip/widget/setting_body.dart';
import 'package:introscreen/settings_makemytrip/widget/setting_header.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double val = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Header(),
              Padding(
                padding: EdgeInsets.only(top: val),
                child: SettingBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
