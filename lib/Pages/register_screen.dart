import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 162, 99, 1.0),
      body: Stack(
        children: [
         /**
          * image 
           */ 
         Padding(
              padding: EdgeInsets.only(
                top: 30.h,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/register_logo.png", 
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                  ),
              ),
            ),

            /**
             * scroll section 
             *  */ 
            /**
             * 
             * teks
             */
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.dm),
                    topRight: Radius.circular(40.dm),
                    ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left : 20.w, right:20.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 10.h,), 
                      /**
                       * section form
                       */
                      
                      
                  

                
                    ],
                  ),
                ),
              ),
            ) 
        ],
      )
    );
  }
}