import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';



class CustomButton extends StatefulWidget {
  final Color color;
  final String txt;
  Function onTap;
  CustomButton(this.color, this.txt, this.onTap);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(widget.txt, style: AppFonts.whiteTextStyle),
      style: TextButton.styleFrom(
        backgroundColor: widget.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
      ),
      onPressed: () {
        widget.onTap();
      },
    );
  }
}