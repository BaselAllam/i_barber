import 'package:flutter/material.dart';
import 'package:i_barber/barber/logic/barber_model.dart';
import 'package:i_barber/barber/views/barber_details_screen.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/user/logic/main_model.dart';
import 'package:scoped_model/scoped_model.dart';



class BarberWidget extends StatefulWidget {
  final BarberModel barber;
  const BarberWidget(this.barber);

  @override
  State<BarberWidget> createState() => _BarberWidgetState();
}

class _BarberWidgetState extends State<BarberWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => BarberDetails(widget.barber)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
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
                  image: NetworkImage(widget.barber.barberImage),
                  fit: BoxFit.fill
                )
              ),
              alignment: Alignment.topRight,
              child: ScopedModelDescendant(
                builder: (context, chidl, MainModel model) {
                  if (model.isFavLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return IconButton(
                      icon: Icon(widget.barber.isFav ? Icons.favorite : Icons.favorite_border),
                      color: Colors.red,
                      iconSize: 20.0,
                      onPressed: () {
                        model.favHandle(widget.barber);
                      },
                    );
                  }
                },
              )
            ),
            Text('\n${widget.barber.barberName}', style: AppFonts.subPrimaryTextStyle),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.greyColor, size: 15.0),
                  Text('   ${widget.barber.barberLocation}', style: AppFonts.subTextStyle)
                ],
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < widget.barber.rate; i++)
                Icon(Icons.star, color: AppColors.primaryColor, size: 15.0),
                for (int i = 0; i < 5 - widget.barber.rate; i++)
                Icon(Icons.star, color: AppColors.greyColor, size: 15.0),
                Text('   ${widget.barber.rate}', style: AppFonts.subTextStyle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}