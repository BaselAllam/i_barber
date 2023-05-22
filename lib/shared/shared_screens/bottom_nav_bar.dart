import 'package:flutter/material.dart';
import 'package:i_barber/appointment/views/appointment_screen.dart';
import 'package:i_barber/shared/shared_screens/home_page_screen.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/user/logic/main_model.dart';
import 'package:i_barber/user/views/profile_screen.dart';
import 'package:i_barber/user/views/wishlist_screen.dart';



class BottomNavBar extends StatefulWidget {
  final MainModel model;
  const BottomNavBar(this.model, {super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    await widget.model.getUserLocation();
    await widget.model.getCategories();
    await widget.model.getBarbers();
    await widget.model.getfav();
  }

  int selectedIndex = 0;

  final List<Map<String, dynamic>> icons = [
    {
      'icon' : Icons.home,
      'screen' : HomeScreen()
    },
    {
      'icon' : Icons.calendar_month,
      'screen' : AppointmentScreen()
    },
    {
      'icon' : Icons.favorite_border,
      'screen' : WishlistScreen()
    },
    {
      'icon' : Icons.person,
      'screen' : ProfileScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(color: AppColors.primaryColor, size: 25.0),
        unselectedIconTheme: IconThemeData(color: AppColors.greyColor, size: 25.0),
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        items: [
          for (int i = 0; i < icons.length; i++)
          BottomNavigationBarItem(
            icon: Icon(icons[i]['icon']),
            label: ''
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: icons[selectedIndex]['screen'],
    );
  }
}