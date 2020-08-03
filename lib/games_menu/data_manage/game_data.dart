import 'dart:convert';

import 'package:clearApp/login/login_info.dart';

class GameData {
  String gameType;
  String description;
  DateTime dateTime;
  bool canAttend;
  bool constructed;
  bool deleted;
  double maxCapacity;
  List<LoginInfo> participantList;

  GameData(Map<String, dynamic> formData) {
    gameType = formData['gameType'];
    description = formData['description'];
    dateTime = formData['dateTime'];
    canAttend = true;
    constructed = false;
    deleted = false;
    maxCapacity = formData['maxCapacity'];
    participantList = new List();
  }

  GameData.fromMap(Map<String, dynamic> map)
      : gameType = (jsonDecode(map['gameType']) as String),
        description = (jsonDecode(map['description']) as String),
        dateTime = DateTime.parse(jsonDecode(map['dateTime'])),
        canAttend = jsonDecode(map['canAttend']),
        constructed = jsonDecode(map['constructed']),
        deleted = jsonDecode(map['deleted']),
        maxCapacity = double.parse((map['maxCapacity'])),
        participantList = (jsonDecode(map['participantList']) as List)
            .map((info) => LoginInfo.fromMap(info))
            .toList();

  Map<String, dynamic> toMap() => {
        'gameType': gameType,
        'description': description,
        'dateTime': dateTime.toString(),
        'canAttend': canAttend,
        'constructed': constructed,
        'deleted': deleted,
        'maxCapacity': maxCapacity,
        'participantList': participantList.map((info) => info.toMap()).toList()
      };
}
