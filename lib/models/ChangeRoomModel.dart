import 'dart:convert';


List<ChangeRoomModel> changeRoomModelFromJson(String str) => List<ChangeRoomModel>.from(json.decode(str).map((x) => ChangeRoomModel.fromJson(x)));
String changeRoomModelToJson(List<ChangeRoomModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChangeRoomModel {
  ChangeRoomModel({
      String? id,
      String? currentRoomNumber, 
      String? changeRoomNumber, 
      String? currentBlock, 
      String? changeBlock, 
      String? studentEmailId, 
      String? changeReason,
  }){
    _id = id;
    _currentRoomNumber = currentRoomNumber;
    _changeRoomNumber = changeRoomNumber;
    _currentBlock = currentBlock;
    _changeBlock = changeBlock;
    _studentEmailId = studentEmailId;
    _changeReason = changeReason;
  }
  Map<String, dynamic>? studentData;

  ChangeRoomModel.fromJson(dynamic json) {
    _id = json['_id'];
    _currentRoomNumber = json['currentRoomNumber'];
    _changeRoomNumber = json['changeRoomNumber'];
    _currentBlock = json['currentBlock'];
    _changeBlock = json['changeBlock'];
    _studentEmailId = json['studentEmailId'];
    _changeReason = json['changeReason'];
    studentData = null;
  }
  String? _id;
  String? _currentRoomNumber;
  String? _changeRoomNumber;
  String? _currentBlock;
  String? _changeBlock;
  String? _studentEmailId;
  String? _changeReason;
ChangeRoomModel copyWith({
  String? id,
  String? currentRoomNumber,
  String? changeRoomNumber,
  String? currentBlock,
  String? changeBlock,
  String? studentEmailId,
  String? changeReason,
}) => ChangeRoomModel(
  id: id ?? _id,
  currentRoomNumber: currentRoomNumber ?? _currentRoomNumber,
  changeRoomNumber: changeRoomNumber ?? _changeRoomNumber,
  currentBlock: currentBlock ?? _currentBlock,
  changeBlock: changeBlock ?? _changeBlock,
  studentEmailId: studentEmailId ?? _studentEmailId,
  changeReason: changeReason ?? _changeReason,
);
  String? get id => _id;
  String? get currentRoomNumber => _currentRoomNumber;
  String? get changeRoomNumber => _changeRoomNumber;
  String? get currentBlock => _currentBlock;
  String? get changeBlock => _changeBlock;
  String? get studentEmailId => _studentEmailId;
  String? get changeReason => _changeReason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['currentRoomNumber'] = _currentRoomNumber;
    map['changeRoomNumber'] = _changeRoomNumber;
    map['currentBlock'] = _currentBlock;
    map['changeBlock'] = _changeBlock;
    map['studentEmailId'] = _studentEmailId;
    map['changeReason'] = _changeReason;
    return map;
  }

}