

class BarberModel {

  final String id;
  final String barberName;
  final String barberImage;
  final String barberLocation;
  final num rate;
  bool isFav;

  BarberModel(this.id, this.barberName, this.barberImage, this.barberLocation, this.rate, this.isFav);

  factory BarberModel.fromJson(String id, Map<String, dynamic> data) {
    return BarberModel(
      id,
      data['barberName'],
      data['barberImage'],
      data['barberLocation'],
      data['rate'],
      false
    ); 
  }
}