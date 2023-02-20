import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';



class BarberWidget extends StatefulWidget {
  final Map<String, dynamic> barber;
  const BarberWidget(this.barber);

  @override
  State<BarberWidget> createState() => _BarberWidgetState();
}

class _BarberWidgetState extends State<BarberWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(widget.barber['barberImage']),
                fit: BoxFit.fill
              )
            ),
          ),
          Text('\n${widget.barber['barberName']}', style: AppFonts.subPrimaryTextStyle),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: AppColors.greyColor, size: 15.0),
                Text('   ${widget.barber['barberLocation']}', style: AppFonts.subTextStyle)
              ],
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < widget.barber['rate']; i++)
              Icon(Icons.star, color: AppColors.primaryColor, size: 15.0),
              for (int i = 0; i < 5 - widget.barber['rate']; i++)
              Icon(Icons.star, color: AppColors.greyColor, size: 15.0),
              Text('   ${widget.barber['rate']}', style: AppFonts.subTextStyle)
            ],
          ),
        ],
      ),
    );
  }
}