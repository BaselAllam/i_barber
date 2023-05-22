import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/shared/shared_widgets/barber_widget.dart';
import 'package:i_barber/user/logic/main_model.dart';
import 'package:scoped_model/scoped_model.dart';


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
      body: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          if (model.isGetBarberFavLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (model.allFavBarbers.isEmpty) {
            return Center(child: Text('No Fav here', style: AppFonts.hugePrimaryTextStyle));
          } else {
            return Container(
              margin: EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: model.allFavBarbers.length,
                itemBuilder: (context, index) {
                  return BarberWidget(model.allFavBarbers[index]);
                },
              ),
            );
          }
        },
      )
    );
  }
}