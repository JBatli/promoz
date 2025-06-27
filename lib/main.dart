
import 'package:flutter/material.dart';
import 'package:promoz/screens/login/login.dart';
import 'package:promoz/screens/login/signup.dart';
import 'package:promoz/screens/admin/admin_dashboard.dart';
import 'package:promoz/screens/admin/settings_management.dart';
import 'package:promoz/screens/customer/customer_dashboard.dart';
import 'package:promoz/screens/customer/promotions_listing.dart';
import 'package:promoz/screens/offerings/offering_detail.dart';
import 'package:promoz/screens/vendor/offerings_management.dart';
import 'package:promoz/screens/vendor/vendor_dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const Promoz());
}

class Promoz extends StatelessWidget {
  const Promoz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promoz',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/admin_dashboard': (context) => const AdminDashboard(),
        '/settings_management': (context) => const SettingsManagement(),
        '/customer_dashboard': (context) => const CustomerDashboard(),
        '/promotions_listing': (context) => const PromotionsListing(),
        '/offering_detail': (context) => const OfferingDetail(),
        '/offerings_management': (context) => const OfferingsManagement(),
        '/vendor_dashboard': (context) => const VendorDashboard(),
      },
    );
  }
}