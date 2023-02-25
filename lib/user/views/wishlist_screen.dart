import 'package:flutter/material.dart';
import 'package:i_barber/demo_data.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/shared/shared_widgets/barber_widget.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Wishlist',
          style: AppFonts.primaryTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: barberData.length,
          itemBuilder: (context, index) {
            return BarberWidget(barberData[index]);
          },
        ),
      ),
    );
  }
}