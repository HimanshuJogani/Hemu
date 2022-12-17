import 'package:flutter/material.dart';
import 'package:joganibrothers/core/navigation/route_info.dart';
import 'package:joganibrothers/features/bill/presentation/pages/bill_page.dart';
import 'package:joganibrothers/features/home/presentation/pages/home_page.dart';
import 'package:joganibrothers/features/products/presentation/pages/add_product_page.dart';
import '../../features/splash/presentation/pages/splash.dart';
import '../../features/transport_bill/presentation/pages/transport_bill_page.dart';

class Router {
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) {
          return const SplashPage();
        });
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) {
          return HomePage();
        });
      case RoutesName.bill:
        return MaterialPageRoute(builder: (_) {
          return BillPage();
        });
      case RoutesName.transportBill:
        return MaterialPageRoute(builder: (_) {
          return const TransportBillPage();
        });
      case RoutesName.products:
        return MaterialPageRoute(builder: (_) {
          return AddProductPage();
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}