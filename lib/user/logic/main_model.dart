

import 'package:i_barber/barber/logic/barber_controller.dart';
import 'package:i_barber/category/logic/category_controller.dart';
import 'package:i_barber/user/logic/map_controller.dart';
import 'package:scoped_model/scoped_model.dart';

final String domainName = 'https://ibarber-386215-default-rtdb.firebaseio.com';

class MainModel extends Model with CategoryController, MapController, BarberController {}