import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/authors/authors_controller.dart';
import 'package:flutter_ecommerce/src/controllers/brands/brands_controller.dart';
import 'package:flutter_ecommerce/src/controllers/posts_blogger/posts_blogger_controller.dart';
import 'package:flutter_ecommerce/src/controllers/posts_brand/posts_brand_controller.dart';
import 'package:flutter_ecommerce/src/screens/explore_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/src/screens/login_screen.dart';
import 'package:flutter_ecommerce/src/screens/register_screen.dart';
import 'package:flutter_ecommerce/src/screens/start_screen.dart';
import 'package:flutter_ecommerce/src/screens/swipe_screen.dart';

import 'controllers/swipe/swipe_controller.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SwipeService>(builder: (_) => SwipeService()),
        Provider<PostsBrandService>(builder: (_) => PostsBrandService()),
        Provider<PostsBloggerService>(builder: (_) => PostsBloggerService()),
        Provider<BrandsService>(builder: (_) => BrandsService()),
        Provider<AuthorsService>(builder: (_) => AuthorsService()),
      ],
      child: RunMaterialApp(),
    );
  }
}

class RunMaterialApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RunMaterialAppState();
  }
}

class _RunMaterialAppState extends State<RunMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter E-commerce",
      home: StartScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          body1: TextStyle(
            fontWeight: FontWeight.w300,
          ),
          title: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 24.0,
          ),
          body2: TextStyle(
            fontWeight: FontWeight.w300,
          ),
          display1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24.0,
          ),
        ),
        canvasColor: ThemeData.dark().canvasColor.withOpacity(0.9),
        accentColor: Colors.white.withOpacity(0.8),
        cursorColor: Colors.white.withOpacity(0.8),
        cardColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      routes: {
        '/login': (BuildContext context) => LoginScreen(),
        '/register': (BuildContext context) => RegisterScreen(),
        '/swipe': (BuildContext context) => SwipeScreen(),
        '/explore': (BuildContext context) => ExploreScreen(),
      },
    );
  }
}
