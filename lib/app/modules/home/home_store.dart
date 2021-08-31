import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_coins/app/shared/util/value/const_srtring.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/models/coins_model.dart';
import '../../shared/repository/coin_repository.dart';
import '../../shared/util/general_functions.dart';
import '../../shared/util/value/const_colors.dart';

part 'home_store.g.dart';

// -> User Case
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final genFunctions = Modular.get<GeneralFunctions>();
  final CoinRepository repository;

  @observable
  ObservableFuture<List<CoinModel>>? coins;

  HomeStoreBase(this.repository) {
    fetchCoins(itemSelect);
    changeVersion();
  }

  @action
  fetchCoins(String? typeConin) {
    if (typeConin == null) typeConin = 'USD';
    coins = repository.getAllCoins(typeConin)?.asObservable();
    changeDateUpgrade("${coins?.value?[0].createDate}");
  }

  @observable
  int currentIndex = 0;
  @action
  changePage(int index) => currentIndex = index;

  @observable
  String dateUpgrade = "";
  @action
  changeDateUpgrade(String? value) =>
      value != null ? dateUpgrade = value : dateUpgrade;

  launchURL(_url) async {
    final url = Uri.encodeFull(_url);
    await launch(url);
  }

  @observable
  String? version = "";
  @action
  changeVersion() async {
    version = await genFunctions.getBuildAndVersion();
  }

  @observable
  String? itemSelect = 'USD';
  @action
  changesItenSelect(String? value) async {
    itemSelect = value;
    fetchCoins(value);
  }

  @observable
  List<DropdownMenuItem<String>> listaItensDrop = [];
  @action
  changeslistDropdownMenuItem(List<DropdownMenuItem<String>> value) =>
      listaItensDrop = value;

  @observable
  Color? colorLinkEmail = ConstColors.colorLavenderFloral;
  @observable
  Color? colorLinkDin = ConstColors.colorLavenderFloral;
  @observable
  Color? colorLinkGit = ConstColors.colorLavenderFloral;
  @observable
  Color? colorLinkDoc = ConstColors.colorLavenderFloral;
  @action
  changesColorLink(String text) {
    switch (text) {
      case ConstString.email:
        colorLinkEmail = ConstColors.colorSkyMagenta;
        break;
      case ConstString.linkDin:
        colorLinkDin = ConstColors.colorSkyMagenta;
        break;
      case ConstString.gitHub:
        colorLinkGit = ConstColors.colorSkyMagenta;
        break;
      case ConstString.docFlutter:
        colorLinkDoc = ConstColors.colorSkyMagenta;
        break;
    }
  }

  setFalseProgress() {
    changesProgressLink(false);
  }

  @observable
  bool progressLink = false;
  @action
  changesProgressLink(bool value) => progressLink = value;

  @computed
  bool get isValid => valueToConvert == null;

  String? valueToConvert() {
    if (validatConvetion == null || validatConvetion!.isEmpty) {
      return "É obrigatorio um valor para conversão";
    } else {
      changesValueConvertion();
    }
    return null;
  }

  @observable
  String? validatConvetion;
  @action
  changesValidatConvertion(String? value) {
    return validatConvetion = value;
  }

  @observable
  String? priceCoin = "0";
  @action
  changesPriceCoin(String? value) {
    priceCoin = genFunctions.formatNumber(value!);
    return priceCoin;
  }

  @observable
  String? valueConvertion = "0";
  @action
  changesValueConvertion() {
    valueConvertion =
        genFunctions.calcRealToDollar(priceCoin, validatConvetion);
    return valueConvertion;
  }
}
