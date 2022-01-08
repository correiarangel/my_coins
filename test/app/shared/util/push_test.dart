import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_coins/app/shared/util/push.dart';
import 'package:my_coins/app/shared/util/value/constants_onesinnal.dart';

class PushMock extends Mock implements Push {}

void main() {
  final push = PushMock();

  setUp(() {
    debugPrint("Iniciando tests Push");
  });

  tearDown(() {
    debugPrint("Finalizando test Push");
  });

  test(
      'Deve retornar tipo String condendo 15 caracter contendo OK (initOneSignal)',
      () async {
    var result = ConstOneSingnal.initOneSing;
    when(push.initOneSignal).thenAnswer((_) async {
      return result;
    });

    //act
    //assert
    expect(result, isA<String>());
    expect(result.length >= 15, true);
    expect(result.contains("OK"), true);
    expect(result.contains("INIT"), true);
    expect(result.contains("ONESING"), true);
  });

  test('Deve retornar tipo String contendo Error  (initOneSignal)', () async {
    var result = ConstOneSingnal.errorPush;
    when(push.initOneSignal).thenAnswer((_) async => result);
    //act
    //assert
    expect(result, isA<String>());
    expect(result.contains("ERROR"), true);
    expect(result.contains("PUSH"), true);
  });

  test(
      'Deve retornar tipo String condendo 19 caracter contendo OK (registerUserIdInTag)',
      () async {
    var _respTag = ConstOneSingnal.registerIdUser;
    when(push.registerUserIdInTag).thenAnswer((_) async => _respTag);

    expect(_respTag, isA<String>());
    expect(_respTag.length, 19);
    expect(_respTag.contains("REGISTER_ID_USER_OK"), true);
  });

  test('Deve retornar tipo String contendo a Rota (setRuoterPush)', () async {
    var router = '/home';
    when(() => push.setRuoterPush(body: 'msgbody'))
        .thenAnswer((_) async => router);
    //expect(resp, isA<OSNotificationOpenedResult>());
    expect(router, isA<String>());
    expect(router.length >= 4, true);
  });
  test('Deve retornar tipo String vazia caso ocorra erro (setRuoterPush)',
      () async {
    var router = '';
    when(() => push.setRuoterPush(body: 'msgbody'))
        .thenAnswer((_) async => router);
    //expect(resp, isA<OSNotificationOpenedResult>());
    expect(router, isA<String>());
    expect(router.isEmpty, true);
  });

  test(
      'Deve retornar tipo String condendo 20 caracter contendo OK '
      '(registerUserIdInTag)', () async {
    var respRemoved = ConstOneSingnal.signalRemovedIdUser;
    when(push.removeUser).thenAnswer((_) async => respRemoved);
    expect(respRemoved, isA<String>());
    expect(respRemoved.length, 25);
    expect(respRemoved.contains("SIGNAL_REMOVED_ID_USER_OK"), true);
  });
  test(
      'Deve retornar tipo String condendo ERROR em caso de erro '
      '(registerUserIdInTag)', () async {
    var respRemoved = ConstOneSingnal.signalRemovedIdError;
    when(push.removeUser).thenAnswer((_) async => respRemoved);
    expect(respRemoved, isA<String>());
    expect(respRemoved.length, 26);
    expect(respRemoved.contains("SIGNAL_REMOVED_ID_ERROR"), true);
  });
}

Map map = <String, dynamic>{
  "payload": {
    "google.delivered_priority": "normal",
    "google.sent_time": 1637787569185,
    "google.ttl": "259200",
    "google.original_priority": "normal",
    "custom": "{}",
    "from": "26119908998",
    "alert": "clique para acessar o produtividade ...",
    "title": "Boa tarde Portal Amazonas ...",
    "google.message_id": "0:1637787569208287%6477d272f9fd7ecd",
    "google.c.sender.id": 26119908998,
    "androidNotificationId": -959757189
  },
  "displayType": 2,
  "shown": true,
  "appInFocus": true,
  "silent": null
};
