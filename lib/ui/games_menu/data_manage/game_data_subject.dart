import 'dart:convert';
import 'package:clearApp/widget/popup_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:clearApp/util/http_client.dart';
import 'game_data.dart';
import 'events.dart';

class GameDataSubject extends ChangeNotifier {
  List<GameData> gameDataList = new List<GameData>();
  bool isFeching = true;

  //etc
  BuildContext _context;

  GameDataSubject(BuildContext context) {
    _context = context;
    eventHandle(EVENT.FechingEvent);
  }

  void fechingStartNotify() {
    isFeching = true;
    notifyListeners();
  }

  void fechingFinishNotify() {
    isFeching = false;
    notifyListeners();
  }

  void eventHandle(
    EVENT eventType, {
    GameData newGame,
  }) async {
    try {
      fechingStartNotify();
      switch (eventType) {
        case EVENT.MakeGameEvent:
          Logger().i('Make Game Event occured');
          await makeGame(newGame);
          break;
        case EVENT.ChangeAttendableEvent:
          break;
        case EVENT.ChangeAttendStateEvent:
          break;
        case EVENT.DeleteGameEvent:
          break;
        case EVENT.FechingEvent:
          Logger().i('Fetching Event occured');
          await getGames();
          break;
        default:
          Logger().e('ERROR: unknown event: $eventType');
          throw ('unknown event');
      }
      fechingFinishNotify();
    } catch (error) {
      Logger().e('error... $error');
      PopupGenerator.errorPopupWidget(
          _context,
          'ERROR!',
          'Please check internet connection : $error',
          () => Navigator.pushNamed(_context, '/homescreen')).show();
    }
    Logger().i('Event handling finished');
  }

  Future<void> makeGame(GameData newGame) async {
    Map<String, dynamic> response = await HttpClient.send(
        method: "get", address: "TODO", body: newGame.toMap());
    newGame.key = response['data'];
    gameDataList.add(newGame);
  }

  Future<void> getGames() async {
    Map<String, dynamic> response =
        await HttpClient.send(method: "get", address: "TODO");

    gameDataList = new List<GameData>();

    List<dynamic> jsonList = response['data'];
    jsonList.forEach((element) {
      Map<String, dynamic> _map = element;
      gameDataList.add(GameData.fromMap(_map));
    });
  }
}
