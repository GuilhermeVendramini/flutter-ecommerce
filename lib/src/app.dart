import 'package:flutter/material.dart';
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
        ),
        canvasColor: ThemeData.dark().canvasColor.withOpacity(0.9),
        accentColor: Colors.white.withOpacity(0.8),
        cursorColor: Colors.white.withOpacity(0.8),
        cardColor: Colors.white,
        //buttonColor: Colors.lightBlue[600],
        //appBarTheme: AppBarTheme(color: Colors.lightBlue[600]),
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
