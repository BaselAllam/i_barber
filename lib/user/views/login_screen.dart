import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_screens/bottom_nav_bar.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/shared/shared_widgets/custom_field.dart';
import 'package:i_barber/user/logic/main_model.dart';
import 'package:i_barber/user/logic/user_controller.dart';
import 'package:i_barber/user/views/register_screen.dart';
import 'package:scoped_model/scoped_model.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              child: Text('Login', style: AppFonts.hugePrimaryTextStyle)),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Please Sign in to Continue', style: AppFonts.littlePrimaryTextStyle)
            ),
            SizedBox(height: 20.0,),
            customFiled(Icons.email, 'Email Address', TextInputType.emailAddress, TextInputAction.done, emailController),
            customFiled(Icons.lock, 'Password', TextInputType.text, TextInputAction.done, passwordController),
            ScopedModelDescendant(
              builder: (context, child, MainModel model) {
                return Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Login  ', style: AppFonts.whiteTextStyle),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 25)
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      minimumSize: Size(120.0, 30),
                    ),
                    onPressed: () {
                      if (emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(snack(Colors.red, 'Email Field Required!'));
                      } else if (!emailController.text.contains('@')) {
                        ScaffoldMessenger.of(context).showSnackBar(snack(Colors.red, 'Email not Valid!'));
                      } else if (passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(snack(Colors.red, 'Password Field Required!'));
                      } else {
                        saveLocal();
                        ScaffoldMessenger.of(context).showSnackBar(snack(Colors.green, 'Sucess!'));
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavBar(model)));
                      }
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 100.0,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                },
                child: Row(
                  children: [
                    Text('Don\'t Have an Account?  ', style: AppFonts.littlePrimaryTextStyle),
                    Text('Signup', style: AppFonts.littlePrimaryColorTextStyle),
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