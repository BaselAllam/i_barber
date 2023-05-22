import 'package:i_barber/barber/logic/barber_model.dart';
import 'package:i_barber/user/logic/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin BarberController on Model {

  bool _isGetBarberLoading = false;
  bool get isGetBarberLoading => _isGetBarberLoading;

  bool _isGetBarberFavLoading = false;
  bool get isGetBarberFavLoading => _isGetBarberFavLoading;

  bool _isFavLoading = false;
  bool get isFavLoading => _isFavLoading;

  List<BarberModel> _allBarbers = [];
  List<BarberModel> get allBarbers => _allBarbers;

  List<BarberModel> _allFavBarbers = [];
  List<BarberModel> get allFavBarbers => _allFavBarbers;


  Future<void> getBarbers() async {

    _isGetBarberLoading = true;
    notifyListeners();

    http.Response response = await http.get(Uri.parse('$domainName/barber.json'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.forEach((key, value) {
        _allBarbers.add(BarberModel.fromJson(key, value));
      });
    }

    _isGetBarberLoading = false;
    notifyListeners();
  }

  Future<void> getfav() async {

    _isGetBarberFavLoading = true;
    notifyListeners();

    http.Response response = await http.get(Uri.parse('$domainName/wishlist.json'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.forEach((key, value) {
        _allBarbers.forEach((element) {
          if (value['barberId'] == element.id) {
            element.isFav = true;
            _allFavBarbers.add(element);
          }
        });
      });
    }

    _isGetBarberFavLoading = false;
    notifyListeners();
  }

  void favHandle(BarberModel barberModel) {
    _isFavLoading = true;
    notifyListeners();
    
    if (barberModel.isFav) {
      _removeFromFav(barberModel);
    } else {
      _addToFav(barberModel);
    }

    _isFavLoading = false;
    notifyListeners();
  }

  Future<bool> _addToFav(BarberModel barberModel) async {

    Map<String, dynamic> data = {
      'barberId' : barberModel.id,
      'userId' : 2
    };

    http.Response response = await http.post(
      Uri.parse('$domainName/wishlist.json'),
      body: json.encode(data)
    );

    if (response.statusCode == 200) {
      barberModel.isFav = true;
      _allFavBarbers.add(barberModel);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _removeFromFav(BarberModel barberModel) async {

    http.Response response = await http.delete(Uri.parse('$domainName/wishlist/${barberModel.id}.json'));

    if (response.statusCode == 200) {
      for (int i = 0; i < _allFavBarbers.length; i++) {
        if (_allFavBarbers[i].id == barberModel.id) {
          _allFavBarbers.removeAt(i);
          break;
        }
      }
      barberModel.isFav = false;
      return true;
    } else {
      return false;
    }
  }
}