import 'dart:convert';

List<StaffModel> staffModelFromJson(String str) => List<StaffModel>.from(json.decode(str).map((x) => StaffModel.fromJson(x)));
String staffModelToJson(List<StaffModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StaffModel {
  StaffModel({
      String? id, 
      String? authority, 
      String? userName, 
      String? firstName, 
      String? lastName, 
      String? jobRole, 
      String? phoneNo, 
      String? email, 
      String? password, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _authority = authority;
    _userName = userName;
    _firstName = firstName;
    _lastName = lastName;
    _jobRole = jobRole;
    _phoneNo = phoneNo;
    _email = email;
    _password = password;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  StaffModel.fromJson(dynamic json) {
    _id = json['_id'];
    _authority = json['authority'];
    _userName = json['userName'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _jobRole = json['jobRole'];
    _phoneNo = json['phoneNo'];
    _email = json['email'];
    _password = json['password'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _authority;
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _jobRole;
  String? _phoneNo;
  String? _email;
  String? _password;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
StaffModel copyWith({  String? id,
  String? authority,
  String? userName,
  String? firstName,
  String? lastName,
  String? jobRole,
  String? phoneNo,
  String? email,
  String? password,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => StaffModel(  id: id ?? _id,
  authority: authority ?? _authority,
  userName: userName ?? _userName,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  jobRole: jobRole ?? _jobRole,
  phoneNo: phoneNo ?? _phoneNo,
  email: email ?? _email,
  password: password ?? _password,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get authority => _authority;
  String? get userName => _userName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get jobRole => _jobRole;
  String? get phoneNo => _phoneNo;
  String? get email => _email;
  String? get password => _password;
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
    map['jobRole'] = _jobRole;
    map['phoneNo'] = _phoneNo;
    map['email'] = _email;
    map['password'] = _password;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}