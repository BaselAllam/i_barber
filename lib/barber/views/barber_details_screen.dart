import 'package:flutter/material.dart';
import 'package:i_barber/barber/logic/barber_model.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';



class BarberDetails extends StatefulWidget {
  final BarberModel barber;
  const BarberDetails(this.barber);

  @override
  State<BarberDetails> createState() => _BarberDetailsState();
}

class _BarberDetailsState extends State<BarberDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Barber Details',
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