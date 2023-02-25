import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final List<Map<String, dynamic>> items = [
    {
      'icon' : Icons.person,
      'title' : 'Profile Data'
    },
    {
      'icon' : Icons.language,
      'title' : 'App Language'
    },
    {
      'icon' : Icons.notifications,
      'title' : 'App Notifications'
    },
    {
      'icon' : Icons.exit_to_app_sharp,
      'title' : 'Logout'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'My Profile',
          style: AppFonts.primaryTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(items[index]['icon'], color: AppColors.primaryColor, size: 20.0),
              title: Text(items[index]['title'], style: AppFonts.subPrimaryTextStyle),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyColor, size: 20.0),
            );
          },
        ),
      ),
    );
  }
}

// log out
// about us
// contact us
// language
// edit profile ( profile data )