import 'dart:async';
import 'package:flutter/material.dart';
import 'package:joganibrothers/core/navigation/route_info.dart';
import 'package:joganibrothers/utils/constant/image_path.dart';

import '../../../../core/theme/text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushNamedAndRemoveUntil(context, RoutesName.home,(route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagePath.splashImg),
          const Divider(),
          Text('Jogani Brothers',style: AppTextStyles.labelStyle.copyWith(fontSize: 42),)
        ],
      ),
    );
  }
}

