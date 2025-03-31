/*
*
Class untuk route page
:: digunakan untuk rute ke page lain.
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsmhc/Pages/bottom_nav.dart';
import 'package:nsmhc/Pages/data_anak_screen.dart';
import 'package:nsmhc/Pages/data_diri_screen.dart';
import 'package:nsmhc/Pages/data_suami_screen.dart';
import 'package:nsmhc/Pages/edit_profile_screen.dart';
// import 'package:nsmhc/Pages/home_screen.dart';
import 'package:nsmhc/Pages/login_screen.dart';
import 'package:nsmhc/Pages/materi_screen.dart';
import 'package:nsmhc/Pages/profile_screen.dart';
import 'package:nsmhc/Pages/register_screen.dart';
import 'package:nsmhc/Pages/splash_screen.dart';
import 'package:nsmhc/Pages/welcome_screen.dart';

class Routers {
  static Route<dynamic> generatedRoute(RouteSettings settings){
    switch(settings.name){
      case "/splash":
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case "/welcome_screen":
        return MaterialPageRoute(builder: (_)=> const WelcomeScreen());
      case "/register_screen":
        return MaterialPageRoute(builder: (_)=> const RegisterScreen());
      case "/login_screen":
        return MaterialPageRoute(builder: (_)=> const LoginScreen());
      case "/profile_screen":
        return MaterialPageRoute(builder: (_)=> const ProfileScreen());
      case "/edit_profile_screen":
        return MaterialPageRoute(builder: (_)=> const EditProfileScreen());
      case "/data_diri_screen":
        return MaterialPageRoute(builder: (_)=> const DataDiriScreen());
      case "/data_suami_screen":
        return MaterialPageRoute(builder: (_)=> const DataSuamiScreen());
      case "/data_anak_screen":
        return MaterialPageRoute(builder: (_)=> const DataAnakScreen());
      case "/home_screen":
        return MaterialPageRoute(builder: (_)=> const BottomNav());
      case "/materi_screen":
        return MaterialPageRoute(builder: (_)=> const MateriScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        body: Center(
          child: Text("Error 404, page not found!", style: TextStyle(
            color: Colors.grey,
            fontSize: 20.sp
          ),),
        )
      );
    });
  }

}