// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'HomeStoreBase.isValid'))
      .value;

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

  final _$coinsDaysAtom = Atom(name: 'HomeStoreBase.coinsDays');

  @override
  ObservableFuture<List<CoinDaysModel>>? get coinsDays {
    _$coinsDaysAtom.reportRead();
    return super.coinsDays;
  }

  @override
  set coinsDays(ObservableFuture<List<CoinDaysModel>>? value) {
    _$coinsDaysAtom.reportWrite(value, super.coinsDays, () {
      super.coinsDays = value;
    });
  }

  final _$daysAtom = Atom(name: 'HomeStoreBase.days');

  @override
  String? get days {
    _$daysAtom.reportRead();
    return super.days;
  }

  @override
  set days(String? value) {
    _$daysAtom.reportWrite(value, super.days, () {
      super.days = value;
    });
  }

  final _$progssVariationAtom = Atom(name: 'HomeStoreBase.progssVariation');

  @override
  bool get progssVariation {
    _$progssVariationAtom.reportRead();
    return super.progssVariation;
  }

  @override
  set progssVariation(bool value) {
    _$progssVariationAtom.reportWrite(value, super.progssVariation, () {
      super.progssVariation = value;
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

  final _$itemSelectAtom = Atom(name: 'HomeStoreBase.itemSelect');

  @override
  String? get itemSelect {
    _$itemSelectAtom.reportRead();
    return super.itemSelect;
  }

  @override
  set itemSelect(String? value) {
    _$itemSelectAtom.reportWrite(value, super.itemSelect, () {
      super.itemSelect = value;
    });
  }

  final _$colorLinkEmailAtom = Atom(name: 'HomeStoreBase.colorLinkEmail');

  @override
  Color? get colorLinkEmail {
    _$colorLinkEmailAtom.reportRead();
    return super.colorLinkEmail;
  }

  @override
  set colorLinkEmail(Color? value) {
    _$colorLinkEmailAtom.reportWrite(value, super.colorLinkEmail, () {
      super.colorLinkEmail = value;
    });
  }

  final _$colorLinkDinAtom = Atom(name: 'HomeStoreBase.colorLinkDin');

  @override
  Color? get colorLinkDin {
    _$colorLinkDinAtom.reportRead();
    return super.colorLinkDin;
  }

  @override
  set colorLinkDin(Color? value) {
    _$colorLinkDinAtom.reportWrite(value, super.colorLinkDin, () {
      super.colorLinkDin = value;
    });
  }

  final _$colorLinkGitAtom = Atom(name: 'HomeStoreBase.colorLinkGit');

  @override
  Color? get colorLinkGit {
    _$colorLinkGitAtom.reportRead();
    return super.colorLinkGit;
  }

  @override
  set colorLinkGit(Color? value) {
    _$colorLinkGitAtom.reportWrite(value, super.colorLinkGit, () {
      super.colorLinkGit = value;
    });
  }

  final _$colorLinkDocAtom = Atom(name: 'HomeStoreBase.colorLinkDoc');

  @override
  Color? get colorLinkDoc {
    _$colorLinkDocAtom.reportRead();
    return super.colorLinkDoc;
  }

  @override
  set colorLinkDoc(Color? value) {
    _$colorLinkDocAtom.reportWrite(value, super.colorLinkDoc, () {
      super.colorLinkDoc = value;
    });
  }

  final _$colorLinkPolicyAtom = Atom(name: 'HomeStoreBase.colorLinkPolicy');

  @override
  Color? get colorLinkPolicy {
    _$colorLinkPolicyAtom.reportRead();
    return super.colorLinkPolicy;
  }

  @override
  set colorLinkPolicy(Color? value) {
    _$colorLinkPolicyAtom.reportWrite(value, super.colorLinkPolicy, () {
      super.colorLinkPolicy = value;
    });
  }

  final _$colorLinkEvaluationAtom =
      Atom(name: 'HomeStoreBase.colorLinkEvaluation');

  @override
  Color? get colorLinkEvaluation {
    _$colorLinkEvaluationAtom.reportRead();
    return super.colorLinkEvaluation;
  }

  @override
  set colorLinkEvaluation(Color? value) {
    _$colorLinkEvaluationAtom.reportWrite(value, super.colorLinkEvaluation, () {
      super.colorLinkEvaluation = value;
    });
  }

  final _$progressLinkAtom = Atom(name: 'HomeStoreBase.progressLink');

  @override
  bool get progressLink {
    _$progressLinkAtom.reportRead();
    return super.progressLink;
  }

  @override
  set progressLink(bool value) {
    _$progressLinkAtom.reportWrite(value, super.progressLink, () {
      super.progressLink = value;
    });
  }

  final _$textValidatAtom = Atom(name: 'HomeStoreBase.textValidat');

  @override
  String get textValidat {
    _$textValidatAtom.reportRead();
    return super.textValidat;
  }

  @override
  set textValidat(String value) {
    _$textValidatAtom.reportWrite(value, super.textValidat, () {
      super.textValidat = value;
    });
  }

  final _$priceCoinAtom = Atom(name: 'HomeStoreBase.priceCoin');

  @override
  String? get priceCoin {
    _$priceCoinAtom.reportRead();
    return super.priceCoin;
  }

  @override
  set priceCoin(String? value) {
    _$priceCoinAtom.reportWrite(value, super.priceCoin, () {
      super.priceCoin = value;
    });
  }

  final _$valueConvertionAtom = Atom(name: 'HomeStoreBase.valueConvertion');

  @override
  String? get valueConvertion {
    _$valueConvertionAtom.reportRead();
    return super.valueConvertion;
  }

  @override
  set valueConvertion(String? value) {
    _$valueConvertionAtom.reportWrite(value, super.valueConvertion, () {
      super.valueConvertion = value;
    });
  }

  final _$isReverseConversionAtom =
      Atom(name: 'HomeStoreBase.isReverseConversion');

  @override
  bool get isReverseConversion {
    _$isReverseConversionAtom.reportRead();
    return super.isReverseConversion;
  }

  @override
  set isReverseConversion(bool value) {
    _$isReverseConversionAtom.reportWrite(value, super.isReverseConversion, () {
      super.isReverseConversion = value;
    });
  }

  final _$isNetAtom = Atom(name: 'HomeStoreBase.isNet');

  @override
  bool? get isNet {
    _$isNetAtom.reportRead();
    return super.isNet;
  }

  @override
  set isNet(bool? value) {
    _$isNetAtom.reportWrite(value, super.isNet, () {
      super.isNet = value;
    });
  }

  final _$changeVersionAsyncAction = AsyncAction('HomeStoreBase.changeVersion');

  @override
  Future changeVersion() {
    return _$changeVersionAsyncAction.run(() => super.changeVersion());
  }

  final _$changesItenSelectAsyncAction =
      AsyncAction('HomeStoreBase.changesItenSelect');

  @override
  Future changesItenSelect(String? value) {
    return _$changesItenSelectAsyncAction
        .run(() => super.changesItenSelect(value));
  }

  final _$changesIsNetAsyncAction = AsyncAction('HomeStoreBase.changesIsNet');

  @override
  Future changesIsNet() {
    return _$changesIsNetAsyncAction.run(() => super.changesIsNet());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic fetchCoins(String? typeConin) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.fetchCoins');
    try {
      return super.fetchCoins(typeConin);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchcoinsDays(String? _typeConin) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.fetchcoinsDays');
    try {
      return super.fetchcoinsDays(_typeConin);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? changesDays(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesDays');
    try {
      return super.changesDays(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool changesProgressVariation(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesProgressVariation');
    try {
      return super.changesProgressVariation(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int changePage(int index) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String changeDateUpgrade(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeDateUpgrade');
    try {
      return super.changeDateUpgrade(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color? changesColorLink(String text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesColorLink');
    try {
      return super.changesColorLink(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color? changesColorLinkEvaluation() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesColorLinkEvaluation');
    try {
      return super.changesColorLinkEvaluation();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool changesProgressLink(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesProgressLink');
    try {
      return super.changesProgressLink(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String changesTextValidat(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesTextValidat');
    try {
      return super.changesTextValidat(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? changesPriceCoin(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesPriceCoin');
    try {
      return super.changesPriceCoin(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? changesValueConvertion() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesValueConvertion');
    try {
      return super.changesValueConvertion();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? changesTestIsBitCoin(dynamic value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesTestIsBitCoin');
    try {
      return super.changesTestIsBitCoin(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool changesIsReverseConversion() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changesIsReverseConversion');
    try {
      return super.changesIsReverseConversion();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coins: ${coins},
coinsDays: ${coinsDays},
days: ${days},
progssVariation: ${progssVariation},
currentIndex: ${currentIndex},
dateUpgrade: ${dateUpgrade},
version: ${version},
itemSelect: ${itemSelect},
colorLinkEmail: ${colorLinkEmail},
colorLinkDin: ${colorLinkDin},
colorLinkGit: ${colorLinkGit},
colorLinkDoc: ${colorLinkDoc},
colorLinkPolicy: ${colorLinkPolicy},
colorLinkEvaluation: ${colorLinkEvaluation},
progressLink: ${progressLink},
textValidat: ${textValidat},
priceCoin: ${priceCoin},
valueConvertion: ${valueConvertion},
isReverseConversion: ${isReverseConversion},
isNet: ${isNet},
isValid: ${isValid}
    ''';
  }
}
