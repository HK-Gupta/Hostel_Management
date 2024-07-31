import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));
String userResponseToJson(UserResponse data) => json.encode(data.toJson());
class UserResponse {
  UserResponse({
      String? id,
      String? authority,
      String? userName, 
      String? firstName, 
      String? lastName, 
      String? phoneNo, 
      String? email, 
      String? password, 
      String? blockNo, 
      String? roomNo, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _authority = authority;
    _userName = userName;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNo = phoneNo;
    _email = email;
    _password = password;
    _blockNo = blockNo;
    _roomNo = roomNo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  UserResponse.fromJson(dynamic json) {
    _id = json['_id'];
    _authority = json['authority'];
    _userName = json['userName'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _phoneNo = json['phoneNo'];
    _email = json['email'];
    _password = json['password'];
    _blockNo = json['blockNo'];
    _roomNo = json['roomNo'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _authority;
  String? _id;
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _phoneNo;
  String? _email;
  String? _password;
  String? _blockNo;
  String? _roomNo;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
UserResponse copyWith({  String? id,
  String? authority,
  String? userName,
  String? firstName,
  String? lastName,
  String? phoneNo,
  String? email,
  String? password,
  String? blockNo,
  String? roomNo,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => UserResponse(  id: id ?? _id,
  authority: authority ?? _authority,
  userName: userName ?? _userName,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  phoneNo: phoneNo ?? _phoneNo,
  email: email ?? _email,
  password: password ?? _password,
  blockNo: blockNo ?? _blockNo,
  roomNo: roomNo ?? _roomNo,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get authority => _authority;
  String? get userName => _userName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phoneNo => _phoneNo;
  String? get email => _email;
  String? get password => _password;
  String? get blockNo => _blockNo;
  String? get roomNo => _roomNo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['authority'] = _authority;
    map['userName'] = _userName;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['phoneNo'] = _phoneNo;
    map['email'] = _email;
    map['password'] = _password;
    map['blockNo'] = _blockNo;
    map['roomNo'] = _roomNo;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}