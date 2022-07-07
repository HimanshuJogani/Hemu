import 'package:flutter/material.dart';
import 'package:introscreen/settings_makemytrip/widget/setting_body.dart';
import 'package:introscreen/settings_makemytrip/widget/setting_header.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: const [
              Header(),
              SizedBox(
                height: 20,
              ),
              SettingBody()
            ],
          ),
        ),
      ),
    );
  }
}
