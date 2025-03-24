import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget TextFieldCustom(
  BuildContext context, {
  num width_percent = 0.8,
  double radius = 10,
  Color? border_color,
  String? label,
  TextEditingController? text_controller,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * width_percent,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      // border: Border.all(color: border_color!)
    ),
    child: TextFormField(
      controller: text_controller,
      validator: (String? sr) {
        String pattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(sr!) && label == "Email") {
          return 'Masukkan alamat email yang valid!';
        } else {
          if (sr == null || sr.isEmpty) {
            return 'Tidak boleh kosong!';
          }
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          label: Text(
            label!,
            style: TextStyle(
                color: const Color.fromRGBO(242, 162, 99, 1.0),
                fontFamily: "Poppins",
                fontSize: 18.sp),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: border_color!))),
    ),
  );
}
