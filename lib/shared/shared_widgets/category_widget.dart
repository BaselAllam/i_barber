import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';



class CategoryWidget extends StatefulWidget {
  final String categoryTitle;
  final IconData categoryIcon;
  CategoryWidget(this.categoryTitle, this.categoryIcon);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightPrimaryColor
            ),
            child: Icon(widget.categoryIcon, color: AppColors.blackColor, size: 30.0),
          ),
          Text('\n${widget.categoryTitle}', style: AppFonts.subPrimaryTextStyle)
        ],
      )
    );
  }
}