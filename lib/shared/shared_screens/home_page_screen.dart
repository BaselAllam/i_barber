import 'package:flutter/material.dart';
import 'package:i_barber/demo_data.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/shared/shared_widgets/barber_widget.dart';
import 'package:i_barber/shared/shared_widgets/category_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Home',
          style: AppFonts.primaryTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Hi, Bassel Allam',
                  style: AppFonts.primaryTextStyle,
                ),
                Icon(Icons.handshake, color: AppColors.primaryColor, size: 20.0,)
              ],
            ),
            Container(
              height: 110.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(categoryData[index]['categoryName'], categoryData[index]['categoryIcon']);
                },
              ),
            ),
            Text('Best Barbers', style: AppFonts.primaryTextStyle),
            Container(
              height: MediaQuery.of(context).size.height / 3.3,
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: barberData.length,
                itemBuilder: (context, index) {
                  return BarberWidget(barberData[index]);
                },
              ),
            ),
            Text('Nearby Barbers', style: AppFonts.primaryTextStyle),
          ],
        ),
      ),
    );
  }
}