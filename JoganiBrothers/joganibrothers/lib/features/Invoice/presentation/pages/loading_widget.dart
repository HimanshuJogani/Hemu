import 'package:flutter/material.dart';
import 'package:joganibrothers/core/theme/jogani_brothers_color.dart';

import '../../../../core/theme/text_styles.dart';

class ProgressDialog {
  static GlobalKey<State> keyLoader = GlobalKey<State>();
  static bool isDialogVisible = false;

  static Future<void> showLoadingDialog(BuildContext context,
      {String message = "Please wait..."}) async {
    isDialogVisible = true;
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              key: keyLoader,
              onWillPop: () async => false,
              child: Material(
                  color: Colors.transparent,
                  child: Center(
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 220),
                        child: Card(
                            color: JoganiBrothersColors.colorWhite,
                            margin: const EdgeInsets.all(20),
                            child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: JoganiBrothersColors.color90gray,
                                          strokeWidth: 2,
                                        )),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          message,
                                          style: AppTextStyles
                                              .labelDescriptionStyle,
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                      ))));
        });
  }

  static hideLoadingDialog(BuildContext context) {
    if (isDialogVisible) {
      Navigator.of(context, rootNavigator: false).pop();
    }
    isDialogVisible = false;
  }
}
