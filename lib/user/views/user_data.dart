import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'My Profile Data',
          style: AppFonts.primaryTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColors.primaryColor,
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: pickedImage == null ? DecorationImage(
                      image: AssetImage('assets/launcher.jpg')
                    ) : DecorationImage(
                      image: FileImage(pickedImage!),
                      fit: BoxFit.fill
                    )
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add_photo_alternate),
                    color: AppColors.blackColor,
                    iconSize: 25.0,
                    onPressed: () async {
                      XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);
                      pickedImage = File(img!.path);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            item('User Name', 'Adam Allam', Icons.person),
            item('User Email', 'AdamAllam@gmail.com', Icons.email),
            item('User Phone', '0101010100', Icons.phone),
            item('User Password', '*******', Icons.lock),
          ],
        ),
      ),
    );
  }

  ListTile item(String title, String subTitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor, size: 20.0),
      title: Text(title, style: AppFonts.primaryTextStyle),
      subtitle: Text(subTitle, style: AppFonts.subPrimaryTextStyle),
    );
  } 
}