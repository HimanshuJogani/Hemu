import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joganibrothers/core/theme/jogani_brothers_color.dart';
import 'package:joganibrothers/features/bill/presentation/cubit/bill_cubit.dart';
import 'package:joganibrothers/features/bill/presentation/pages/bill_page.dart';
import 'package:joganibrothers/features/home/presentation/widgets/home_widget.dart';
import 'package:joganibrothers/features/transport_bill/presentation/pages/transport_bill_page.dart';
import 'package:joganibrothers/utils/constant/image_path.dart';
import '../../../Invoice/presentation/pages/loading_widget.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final List<Widget> _homePage = <Widget>[
    const Items(title: 'Bill'),
    const Items(title: 'Transport Bill')
  ];


  @override
  Widget build(BuildContext context) {
    ProgressDialog.hideLoadingDialog(context);
    final List _routePage = [
      BlocProvider(
        create: (context) => BillCubit(),
        child: BillPage(),
      ),
      const TransportBillPage()
    ];
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:  BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(JoganiBrothersColors.colorWhite.withOpacity(0.7),BlendMode.dstATop),
                image: const AssetImage(ImagePath.wheatBg),
                fit: BoxFit.cover//BoxShadow
             ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              alignment: Alignment.center,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: _homePage.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => _routePage[index]));
                        },
                        child: _homePage[index]
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
