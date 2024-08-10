import 'dart:convert';

List<RoomAvailabilityModel> roomAvailabilityModelFromJson(String str) => List<RoomAvailabilityModel>.from(json.decode(str).map((x) => RoomAvailabilityModel.fromJson(x)));
String roomAvailabilityModelToJson(List<RoomAvailabilityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class RoomAvailabilityModel {
  RoomAvailabilityModel({
      String? id, 
      String? roomNumber, 
      String? roomCapacity, 
      String? roomCurrentCapacity, 
      String? roomType, 
      String? roomStatus, 
      String? blockNumber, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _roomNumber = roomNumber;
    _roomCapacity = roomCapacity;
    _roomCurrentCapacity = roomCurrentCapacity;
    _roomType = roomType;
    _roomStatus = roomStatus;
    _blockNumber = blockNumber;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  RoomAvailabilityModel.fromJson(dynamic json) {
    _id = json['_id'];
    _roomNumber = json['roomNumber'];
    _roomCapacity = json['roomCapacity'];
    _roomCurrentCapacity = json['roomCurrentCapacity'];
    _roomType = json['roomType'];
    _roomStatus = json['roomStatus'];
    _blockNumber = json['blockNumber'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _roomNumber;
  String? _roomCapacity;
  String? _roomCurrentCapacity;
  String? _roomType;
  String? _roomStatus;
  String? _blockNumber;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
RoomAvailabilityModel copyWith({  String? id,
  String? roomNumber,
  String? roomCapacity,
  String? roomCurrentCapacity,
  String? roomType,
  String? roomStatus,
  String? blockNumber,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => RoomAvailabilityModel(  id: id ?? _id,
  roomNumber: roomNumber ?? _roomNumber,
  roomCapacity: roomCapacity ?? _roomCapacity,
  roomCurrentCapacity: roomCurrentCapacity ?? _roomCurrentCapacity,
  roomType: roomType ?? _roomType,
  roomStatus: roomStatus ?? _roomStatus,
  blockNumber: blockNumber ?? _blockNumber,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get roomNumber => _roomNumber;
  String? get roomCapacity => _roomCapacity;
  String? get roomCurrentCapacity => _roomCurrentCapacity;
  String? get roomType => _roomType;
  String? get roomStatus => _roomStatus;
  String? get blockNumber => _blockNumber;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['roomNumber'] = _roomNumber;
    map['roomCapacity'] = _roomCapacity;
    map['roomCurrentCapacity'] = _roomCurrentCapacity;
    map['roomType'] = _roomType;
    map['roomStatus'] = _roomStatus;
    map['blockNumber'] = _blockNumber;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}