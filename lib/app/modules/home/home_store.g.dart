// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$coinsAtom = Atom(name: 'HomeStoreBase.coins');

  @override
  ObservableFuture<List<CoinModel>>? get coins {
    _$coinsAtom.reportRead();
    return super.coins;
  }

  @override
  set coins(ObservableFuture<List<CoinModel>>? value) {
    _$coinsAtom.reportWrite(value, super.coins, () {
      super.coins = value;
    });
  }

  final _$currentIndexAtom = Atom(name: 'HomeStoreBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$dateUpgradeAtom = Atom(name: 'HomeStoreBase.dateUpgrade');

  @override
  String get dateUpgrade {
    _$dateUpgradeAtom.reportRead();
    return super.dateUpgrade;
  }

  @override
  set dateUpgrade(String value) {
    _$dateUpgradeAtom.reportWrite(value, super.dateUpgrade, () {
      super.dateUpgrade = value;
    });
  }

  final _$versionAtom = Atom(name: 'HomeStoreBase.version');

  @override
  String? get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String? value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  final _$changeVersionAsyncAction = AsyncAction('HomeStoreBase.changeVersion');

  @override
  Future changeVersion() {
    return _$changeVersionAsyncAction.run(() => super.changeVersion());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic fetchCoins() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.fetchCoins');
    try {
      return super.fetchCoins();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePage(int index) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDateUpgrade(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeDateUpgrade');
    try {
      return super.changeDateUpgrade(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coins: ${coins},
currentIndex: ${currentIndex},
dateUpgrade: ${dateUpgrade},
version: ${version}
    ''';
  }
}
