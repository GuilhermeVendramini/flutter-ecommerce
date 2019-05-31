import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/screens/login_screen.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return RunMaterialApp();
/*    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>(builder: (_) => MyClass()),
      ],
      child:  RunMaterialApp(),
    );*/
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
      home: LoginScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}