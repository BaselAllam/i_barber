import 'package:flutter/material.dart';
import 'package:i_barber/demo_data.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/shared/shared_widgets/barber_scondary_widget.dart';
import 'package:i_barber/shared/shared_widgets/custom_button.dart';



class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'My Appointments',
          style: AppFonts.primaryTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SafeArea(
              top: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(AppColors.primaryColor, 'UpComing', () {}),
                  CustomButton(AppColors.greyColor, 'Completed', () {}),
                  CustomButton(AppColors.greyColor, 'Cancelled', () {}),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: barberData.length,
                itemBuilder: (context, index) {
                  return BarberSecondaryWidget(barberData[index]);
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}