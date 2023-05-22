import 'package:flutter/material.dart';
import 'package:i_barber/category/logic/category_controller.dart';
import 'package:i_barber/shared/shared_screens/bottom_nav_bar.dart';
import 'package:i_barber/user/logic/main_model.dart';
import 'package:i_barber/user/logic/map_controller.dart';
import 'package:i_barber/user/logic/user_controller.dart';
import 'package:i_barber/user/views/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';


void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLogedIn = false;

  @override
  void initState() {
    checkLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return ScopedModel(
    //   model: MapController(),
    //   child: ScopedModel(
    //     model: CategoryController(),
    //     child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: isLogedIn ? BottomNavBar() : LoginScreen()
    //     )
    //   ),
    // );
    return ScopedModel(
      model: MainModel(),
      child: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: isLogedIn ? BottomNavBar(model) : LoginScreen()
          );
        },
      )
    );
  }

  checkLocal() async {
    bool check = await getLocal();
    isLogedIn = check;
    setState(() {});
  }
}



/*

  Controller
    Any Logic => Method or Group Methods
    Any Logic => Life Cycle
        1- Excution
        2- Process
        3- Change
          a- Success
          b- Failed


*/



// State Managment 
//    ScopedModelDecendtent => act as a parent for any child wants to listen to any change happen.
//    Model => act as a super class for controller class to can use notifylistener inside the logic itself.
//    ScopedModel => being on the top of the app to can share all changes around the app states

