import 'dart:convert';

// Functions to convert from JSON string to List<IssueModel> and vice versa
List<IssueModel> issueModelFromJson(String str) => List<IssueModel>.from(json.decode(str).map((x) => IssueModel.fromJson(x)));
String issueModelToJson(List<IssueModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IssueModel {
  IssueModel({
    String? id,
    String? roomNumber,
    String? blockNumber,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNo,
    String? issue,
    String? comment,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _roomNumber = roomNumber;
    _blockNumber = blockNumber;
    _userName = userName;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phoneNo = phoneNo;
    _issue = issue;
    _comment = comment;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  IssueModel.fromJson(dynamic json) {
    _id = json['_id'];
    _roomNumber = json['roomNumber'];
    _blockNumber = json['blockNumber'];
    _userName = json['userName'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _phoneNo = json['phoneNo'];
    _issue = json['issue'];
    _comment = json['comment'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _roomNumber;
  String? _blockNumber;
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phoneNo;
  String? _issue;
  String? _comment;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  IssueModel copyWith({
    String? id,
    String? roomNumber,
    String? blockNumber,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNo,
    String? issue,
    String? comment,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      IssueModel(
        id: id ?? _id,
        roomNumber: roomNumber ?? _roomNumber,
        blockNumber: blockNumber ?? _blockNumber,
        userName: userName ?? _userName,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        phoneNo: phoneNo ?? _phoneNo,
        issue: issue ?? _issue,
        comment: comment ?? _comment,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );

  String? get id => _id;
  String? get roomNumber => _roomNumber;
  String? get blockNumber => _blockNumber;
  String? get userName => _userName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phoneNo => _phoneNo;
  String? get issue => _issue;
  String? get comment => _comment;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['roomNumber'] = _roomNumber;
    map['blockNumber'] = _blockNumber;
    map['userName'] = _userName;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['phoneNo'] = _phoneNo;
    map['issue'] = _issue;
    map['comment'] = _comment;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
