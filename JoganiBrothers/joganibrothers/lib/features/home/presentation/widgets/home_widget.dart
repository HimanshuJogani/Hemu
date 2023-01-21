import 'package:flutter/material.dart';
import 'package:joganibrothers/core/theme/text_styles.dart';

import '../../../../core/theme/jogani_brothers_color.dart';

class Items extends StatelessWidget {
  const Items({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: JoganiBrothersColors.customDarkBlue.withOpacity(0.8),
      //   decoration: const BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.topLeft,
      //           end: Alignment.topCenter,
      //           stops: [
      //             0.7,
      //             0.7,
      //             0.7,
      //           ],
      //           colors: [
      //             Colors.black12,
      //             Colors.grey,
      //             Colors.black12,
      //           ],
      //         )
      //   ),
        child: Center(
            child: Text(
              title,
              style:
            AppTextStyles.labelStyle2.copyWith(fontSize: 20),
            )
        )
    );
  }
}
