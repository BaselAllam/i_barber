import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_barber/shared/shared_themes/shared_colors.dart';
import 'package:i_barber/shared/shared_themes/shared_fonts.dart';
import 'package:i_barber/shared/shared_widgets/barber_widget.dart';
import 'package:i_barber/shared/shared_widgets/category_widget.dart';
import 'package:i_barber/user/logic/main_model.dart';
import 'package:i_barber/user/logic/map_controller.dart';
import 'package:scoped_model/scoped_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.backGroundColor,
            elevation: 0.0,
            title: Text(
              'Home',
              style: AppFonts.primaryTextStyle,
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Text(
                      'Hi, Bassel Allam',
                      style: AppFonts.primaryTextStyle,
                    ),
                    Icon(Icons.handshake, color: AppColors.primaryColor, size: 20.0,)
                  ],
                ),
                Container(
                  height: 110.0,
                  child: model.isGetCategoryLoading ? Center(child: CircularProgressIndicator()) : 
                    model.allCategories.isEmpty ? Text('No Categories Found', style: AppFonts.primaryTextStyle,) : 
                    ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.allCategories.length,
                    itemBuilder: (context, index) {
                      return CategoryWidget(model.allCategories[index].categoryName, model.allCategories[index].categoryImage);
                    },
                  ),
                ),
                Text('Best Barbers', style: AppFonts.primaryTextStyle),
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: model.isGetBarberLoading ? Center(child: CircularProgressIndicator()) :
                    model.allBarbers.isEmpty ? Text('No Barbers Found', style: AppFonts.primaryTextStyle,) :
                    ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.allBarbers.length,
                    itemBuilder: (context, index) {
                      return BarberWidget(model.allBarbers[index]);
                    },
                  ),
                ),
                Text('Nearby Barbers', style: AppFonts.primaryTextStyle),
                Container(
                  height: 200,
                  child: loadMap(model.isMapDone, model.isMapLoading, model.userLocation)
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget loadMap(bool isMapDone, bool isMapLoading, LatLng latLng) {

    if (isMapDone) {
      return Center(child: CircularProgressIndicator());
    } else if (!isMapDone) {
      return Text('Some thing went wrong', style: AppFonts.subPrimaryTextStyle);
    } else {
      return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: latLng,
          zoom: 12
        ),
      );
    }
  }
}