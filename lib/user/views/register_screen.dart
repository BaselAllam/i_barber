import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/shared/shared_widgets/custom_field.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String gender = '';
  String date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Create an Account', style: AppFonts.hugePrimaryTextStyle)),
            SizedBox(height: 20.0,),
            customFiled(Icons.email, 'Email Address', TextInputType.emailAddress, TextInputAction.done, emailController),
            ListTile(
              title: Text('Birth Data', style: AppFonts.littlePrimaryColorTextStyle),
              subtitle: Text(date, style: AppFonts.littlePrimaryColorTextStyle),
              trailing: IconButton(
                icon: Icon(Icons.calendar_month),
                color: AppColors.blackColor,
                iconSize: 25.0,
                onPressed: () async {
                  // void, return type, async ( waiting for response from third party )
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1990),
                    initialDate: DateTime(1990),
                    lastDate: DateTime(2010),
                  );
                  date = pickedDate.toString().substring(0, 10);
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: Text('Gender', style: AppFonts.littlePrimaryColorTextStyle),
              subtitle: Text(gender, style: AppFonts.littlePrimaryColorTextStyle),
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_downward),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                color: Colors.white,
                iconSize: 25.0,
                itemBuilder: (context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: Text('Male'),
                      value: 'Male',
                    ),
                    PopupMenuItem(
                      child: Text('FeMale'),
                      value: 'FeMale',
                    ),
                  ];
                },
                onSelected: (value) {
                  gender = value;
                  setState(() {});
                },
              )
            ),
            customFiled(Icons.lock, 'Password', TextInputType.text, TextInputAction.done, passwordController),
            customFiled(Icons.lock, 'Confirm Password', TextInputType.text, TextInputAction.done, confirmPasswordController),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Signup  ', style: AppFonts.whiteTextStyle),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 25)
                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  minimumSize: Size(120.0, 30),
                ),
                onPressed: () {
                  
                },
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text('Have an Account?  ', style: AppFonts.littlePrimaryTextStyle),
                    Text('Login', style: AppFonts.littlePrimaryColorTextStyle),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}