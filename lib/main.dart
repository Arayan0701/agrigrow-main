import 'package:agrigrow/deliveryaddress.dart';
import 'package:agrigrow/expert.dart';
import 'package:agrigrow/notificationsscreen.dart';
import 'package:agrigrow/profilescreen.dart';
import 'package:agrigrow/soiltest.dart';
import 'package:agrigrow/thankyou.dart';
import 'package:agrigrow/video.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'welcome.dart';
import 'home_screen.dart';
import 'login.dart';
import 'signuppage.dart';
import 'product_detail.dart';
import 'offer.dart';
import 'offer_productes.dart' hide SignUpPage;
import 'cartpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/WelcomeScreen': (context) => const WelcomeScreen(),
        '/HomeScreen': (context) => HomeScreen(),
        '/Login': (context) => LoginPage(),
        '/EmailSignUp': (context) => SignUpPage(),
        '/ProductDetail': (context) => ProductScreen(),
        '/OfferProduct': (context) => OfferProductsScreen(),
        '/CartPage': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return CartPage(
            quantity: args['quantity'],
            pricePerItem: args['pricePerItem'],
          );
        },
        '/OfferProductPage': (context) => OfferProductPage(),
        '/ProfileScreen': (context) => ProfilePage(),
        '/NotificationScreen': (context) => NotificationScreen(),
        '/DeliveryAddress': (context) => DeliveryAddressPage(),
        '/VideoPage': (context) => VideoPage(),
        '/ExpertPage': (context) => ExpertPage(),
        '/ThankYouPage': (context) => ThankYouPage(),
        '/SoilTestPage': (context) => SoilTestingPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
    );*/
      home: OfferProductsScreen(),
    );
  }
}
