import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

Widget PasswordFieldConfirm(
  BuildContext context, {
  num width_percent = 0.8,
  GlobalKey<FormState>? key,
  double radius = 10,
  Color? border_color,
  String? label,
  Rx<bool>? is_visible,
  TextEditingController? text_controller,
  TextEditingController? paired_text_controller,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * width_percent,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      // border: Border.all(color: border_color!)
    ),
    child: TextFormField(
      key: key,
      controller: text_controller,
      keyboardType: TextInputType.visiblePassword,
      validator: (String? sr) {
                if (sr == null || sr.isEmpty || sr.length < 8) {
                  return 'Tidak boleh kosong dan minimal 8 karakter!';
                }else if(sr != paired_text_controller!.text){
                  return 'Password tidak sesuai!';
                }
                return null;
              },
      obscureText: !is_visible!.value,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              iconSize: 18.sp,
              splashColor: Colors.grey,
              onPressed: () {
                is_visible.value = !is_visible.value;
              },
              icon: (is_visible.value == false)
                  ? Icon(
                      LucideIcons.eyeOff,
                      size: 15.dm,
                    )
                  : Icon(
                      LucideIcons.eye,
                      size: 15.dm,
                    )),
          label: Text(
            label!,
            style: TextStyle(
                color: border_color,
                fontFamily: "Poppins",
                fontSize: 18.sp),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: border_color!))),
    ),
  );
}
