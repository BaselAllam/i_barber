import 'package:flutter/material.dart';
import 'package:i_barber/appointment/views/appointment_details_screen.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/shared/shared_widgets/custom_button.dart';



class BarberSecondaryWidget extends StatefulWidget {
  final Map<String, dynamic> barber;
  const BarberSecondaryWidget(this.barber);

  @override
  State<BarberSecondaryWidget> createState() => _BarberSecondaryWidgetState();
}

class _BarberSecondaryWidgetState extends State<BarberSecondaryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => AppointmentsDetails()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white
        ),
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              title: Text('${widget.barber['barberName']}', style: AppFonts.subPrimaryTextStyle),
              subtitle: Text('Location', style: AppFonts.subTextStyle),
              trailing: CircleAvatar(
                minRadius: 20,
                maxRadius: 20,
                backgroundImage: NetworkImage((widget.barber['barberImage'])),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rowWidget(Icons.calendar_month, '20/12/2020'),
                rowWidget(Icons.watch, '10:05PM'),
                rowWidget(Icons.attach_money, '200\$'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(AppColors.greyColor, 'Cancel', () {}),
                CustomButton(AppColors.primaryColor, 'Re Scheduale', () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rowWidget(IconData icon, String txt) {
    return Row(
      children: [
        Icon(icon, color: AppColors.greyColor, size: 15.0),
        Text('  $txt', style: AppFonts.subTextStyle)
      ],
    );
  }
}