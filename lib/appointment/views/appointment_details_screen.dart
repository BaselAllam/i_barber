import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';



class AppointmentsDetails extends StatefulWidget {
  const AppointmentsDetails({super.key});

  @override
  State<AppointmentsDetails> createState() => _AppointmentsDetailsState();
}

class _AppointmentsDetailsState extends State<AppointmentsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Appointments Details',
          style: AppFonts.primaryTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.greyColor,
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}