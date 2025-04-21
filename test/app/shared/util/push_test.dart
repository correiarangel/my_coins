

//class PushMock extends Mock implements Push {}

void main() {
/*  late IPush push;

  setUpAll(() {
    debugPrint("Inicio de Suite Testes Push");
    push = PushMock();
  });
  setUp(() {
    debugPrint("Iniciando teste");
  });

  tearDown(() {
    debugPrint("Finalizando teste");
  });

  tearDownAll(() {
    debugPrint("Finalizando Suite testes Push");
  });
  group('Caminho Feliz...', () {
    test('Deve retornar tipo String (initOneSignal)', () async {
      var result = ConstOneSingnal.initOneSing;
      when(push.initOneSignal).thenAnswer((_) async {
        return result;
      });
      //act
      //assert
      expect(result, isA<String>());
    });
    test('Deve retornar tipo String condendo 15 caracter (initOneSignal)',
        () async {
      var result = ConstOneSingnal.initOneSing;
      when(push.initOneSignal).thenAnswer((_) async {
        return result;
      });
      expect(result.length >= 15, true);
    });
    test('Deve retornar tipo String condendo OK (initOneSignal)', () async {
      var result = ConstOneSingnal.initOneSing;
      when(push.initOneSignal).thenAnswer((_) async {
        return result;
      });
      expect(result.contains("OK"), true);
    });
    test(
        'Deve retornar tipo String condendo REGISTER_ID_USER_OK (registerUserIdInTag)',
        () async {
      var _respTag = ConstOneSingnal.registerIdUser;
      when(push.registerUserIdInTag).thenAnswer((_) async => _respTag);
      expect(_respTag, isA<String>());
      expect(_respTag.contains("REGISTER_ID_USER_OK"), true);
    });

    test('Deve retornar tipo String contendo a Rota (setRuoterPush)', () async {
      var router = '/home';
      when(() => push.setRuoterPush(body: 'msgbody'))
          .thenAnswer((_) async => router);
      expect(router, isA<String>());
      expect(router.length >= 4, true);
    });

    test(
        'Deve retornar tipo String condendo 20 caracter'
        ' com valor SIGNAL_REMOVED_ID_USER_OK '
        '(registerUserIdInTag)', () async {
      var respRemoved = ConstOneSingnal.signalRemovedIdUser;
      when(push.removeUser).thenAnswer((_) async => respRemoved);
      expect(respRemoved, isA<String>());
      expect(respRemoved.contains("SIGNAL_REMOVED_ID_USER_OK"), true);
    });
  });

  group('Caminho triste...', () {
    test('Deve retornar String contendo ERROR (initOneSignal)', () async {
      var result = ConstOneSingnal.errorPush;
      when(push.initOneSignal).thenAnswer((_) async => result);
      expect(result, isA<String>());
      expect(result.contains("ERROR"), true);
    });
    test('Deve retornar tipo String vazia caso ocorra erro (setRuoterPush)',
        () async {
      var router = '';
      when(() => push.setRuoterPush(body: 'msgbody'))
          .thenAnswer((_) async => router);
      expect(router, isA<String>());
      expect(router.isEmpty, true);
    });
    test(
        'Deve retornar tipo String com valor SIGNAL_REMOVED_ID_ERROR em caso de erro '
        '(registerUserIdInTag)', () async {
      var respRemoved = ConstOneSingnal.signalRemovedIdError;
      when(push.removeUser).thenAnswer((_) async => respRemoved);
      expect(respRemoved, isA<String>());
      expect(respRemoved.contains("SIGNAL_REMOVED_ID_ERROR"), true);
    });
  });
}
*/
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
}
