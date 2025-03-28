import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsmhc/Pages/splash_screen.dart';
import 'package:nsmhc/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
     Set agar device tetap dalam keadaan potrait.
    */
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        
    return  ScreenUtilInit (
      designSize: const Size(390, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child){
        return GetMaterialApp(
          title: 'NSHMHC',
          onGenerateRoute: Routers.generatedRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(242, 162, 99, 1.0)
              )
          ),
          home: child,
        );
      },
      child: const SplashScreen() ,
    );
  }
}
