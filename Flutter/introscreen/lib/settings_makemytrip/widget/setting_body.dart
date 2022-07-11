import 'package:flutter/material.dart';
import 'package:introscreen/settings_makemytrip/widget/field_bottom_sheet.dart';
import 'package:introscreen/settings_makemytrip/widget/setting_body_field.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: const BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
              ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FromField(
                labelName: "FullName",
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return FieldBottomSheet(
                          title: "FullName",
                          txtField: "",
                          callback: (String val) {},
                        );
                      });
                },
                data: "Himanshu Jogani",
              ),
              FromField(
                labelName: "PhoneNumber",
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return FieldBottomSheet(
                          title: "PhoneNumber",
                          txtField: "",
                          callback: (String val) {},
                        );
                      });
                },
                data: "7202033879",
              ),
              FromField(
                wantIcon: false,
                labelName: "Email",
                data: "himanshujogani72020@gmail.com",
                onTap: () {},
              ),
              SwitchField(
                text: "Notification",
                value: true,
                onChanged: (value) {},
              ),
              const Divider(
                color: Colors.black,
              ),
              EndingField(
                txt: "Faq",
                onPressed: () {},
              ),
              const Divider(
                color: Colors.black,
              ),
              EndingField(
                txt: "PrivacyPolicy",
                onPressed: () {},
              ),
              const Divider(
                color: Colors.black,
              ),
              EndingField(
                txt: "TermsCondition",
                onPressed: () {},
              ),
              const Divider(
                color: Colors.black,
              ),
              EndingField(
                txt: "ShareWithFriends",
                onPressed: () {},
              ),
              const Divider(
                color: Colors.black,
              ),
              EndingField(
                txt: "SignOut",
                style: TextStyle(fontSize: 16),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
