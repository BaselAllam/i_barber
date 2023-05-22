import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';


Container customFiled(IconData icon, String title, TextInputType type, TextInputAction action, TextEditingController controller) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: TextField(
      decoration: InputDecoration(
        border: outLineBorder(AppColors.primaryColor),
        enabledBorder: outLineBorder(AppColors.primaryColor),
        focusedBorder: outLineBorder(AppColors.primaryColor),
        prefixIcon: Icon(icon, color: AppColors.primaryColor, size: 20.0),
        labelText: title,
        labelStyle: AppFonts.littlePrimaryColorTextStyle,
      ),
      keyboardType: type,
      textInputAction: action,
      controller: controller
    ),
  );
}

OutlineInputBorder outLineBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(color: color, width: 1.0),
  );
}

SnackBar snack(Color color, String txt) {
  return SnackBar(
    backgroundColor: color,
    content: Text(txt, style: AppFonts.whiteTextStyle,),
    duration: Duration(seconds: 3),
  );
}