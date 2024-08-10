import 'dart:convert';

List<FeesModel> feesModelFromJson(String str) => List<FeesModel>.from(json.decode(str).map((x) => FeesModel.fromJson(x)));
String feesModelToJson(List<FeesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeesModel {
  FeesModel({
      String? maintenanceCharge, 
      String? parkingCharge, 
      String? roomWaterCharge, 
      String? roomCharge,}){
    _maintenanceCharge = maintenanceCharge;
    _parkingCharge = parkingCharge;
    _roomWaterCharge = roomWaterCharge;
    _roomCharge = roomCharge;
}

  FeesModel.fromJson(dynamic json) {
    _maintenanceCharge = json['maintenanceCharge'];
    _parkingCharge = json['parkingCharge'];
    _roomWaterCharge = json['roomWaterCharge'];
    _roomCharge = json['roomCharge'];
  }
  String? _maintenanceCharge;
  String? _parkingCharge;
  String? _roomWaterCharge;
  String? _roomCharge;
FeesModel copyWith({  String? maintenanceCharge,
  String? parkingCharge,
  String? roomWaterCharge,
  String? roomCharge,
}) => FeesModel(  maintenanceCharge: maintenanceCharge ?? _maintenanceCharge,
  parkingCharge: parkingCharge ?? _parkingCharge,
  roomWaterCharge: roomWaterCharge ?? _roomWaterCharge,
  roomCharge: roomCharge ?? _roomCharge,
);
  String? get maintenanceCharge => _maintenanceCharge;
  String? get parkingCharge => _parkingCharge;
  String? get roomWaterCharge => _roomWaterCharge;
  String? get roomCharge => _roomCharge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maintenanceCharge'] = _maintenanceCharge;
    map['parkingCharge'] = _parkingCharge;
    map['roomWaterCharge'] = _roomWaterCharge;
    map['roomCharge'] = _roomCharge;
    return map;
  }

}