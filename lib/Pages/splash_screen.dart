import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      // prefController.cekLogin(context);
      Navigator.pushReplacementNamed(context, '/welcome_screen');
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: const Color.fromRGBO(242, 162, 99, 1),
        systemNavigationBarColor: const Color.fromRGBO(242, 162, 99, 1),
        systemNavigationBarDividerColor: const Color.fromRGBO(242, 162, 99, 1),
        systemNavigationBarIconBrightness: Brightness.light,
      ), 
    child: Scaffold(
      backgroundColor: const Color.fromRGBO(242, 162, 99, 1),
      body: Center(
        child: Image.asset("assets/images/splash_logo.png"),
      ),
    ));
  }
}