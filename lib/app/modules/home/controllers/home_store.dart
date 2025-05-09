import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/models/coins_days_model.dart';
import '../../../shared/models/coins_model.dart';
import '../../../shared/models/coins_parc_model.dart';
import '../../../shared/repository/coin_repository.dart';
import '../../../shared/services/check_internet_service.dart';
import '../../../shared/services/format_service.dart';
import '../../../shared/services/version_service.dart';
import '../../../shared/util/value/const_colors.dart';
import '../../../shared/util/value/const_id_app.dart';
import '../../../shared/util/value/const_srtring.dart';
import 'rate_my_app_controller.dart';

part 'home_store.g.dart';

// -> User Case
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final FormatService genFunctions;
  final VersionService genVersion;
  final CheckInternetService testInternet;
  final CoinRepository repository;

  HomeStoreBase(
    this.repository,
    this.genFunctions,
    this.genVersion,
    this.testInternet,
  ) {
    shouldCallAPI();
  }
  @observable
  ObservableFuture<List<CoinModel>>? coins;

  @observable
  ObservableFuture<List<CoinDaysModel>>? coinsDays;

  @action
  Future<List<CoinModel>> fetchCoins(String typeConin) {
    if (typeConin.isEmpty) typeConin = 'USD';
    coins = repository.getAllCoins(siglaCoin: typeConin).asObservable();
    changeDateUpgrade("${coins!.value?[0].createDate}");
    return coins!;
  }

  @action
  Future<List<CoinDaysModel>> fetchcoinsDays(String _typeConin) {
    if (_typeConin.isEmpty) _typeConin = 'USD';
    days = '8';
    return coinsDays =
        repository
            .getPeriodCoins(siglaCoin: _typeConin, days: days)
            .asObservable();
  }

  @observable
  String days = '8';
  @action
  String changesDays(String value) {
    fetchcoinsDays(itemSelect);
    return days = value;
  }

  @observable
  bool progssVariation = false;
  @action
  // ignore: avoid_positional_boolean_parameters
  bool changesProgressVariation(bool value) => progssVariation = value;
  @observable
  int currentIndex = 0;
  @action
  int changePage(int index) => currentIndex = index;

  @observable
  String dateUpgrade = "";
  @action
  String changeDateUpgrade(String? value) =>
      value != null ? dateUpgrade = value : dateUpgrade;

  Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    developer.log(uri.toString());

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @observable
  String version_ = "";
  @action
  changeVersion() async {
    version_ = await genVersion.getBuildAndVersion() ?? '0';
    return version;
  }

  @observable
  String itemSelect = 'USD';
  @action
  changesItenSelect(String? value) async {
    fetchCoins(value ?? 'USD');
    fetchcoinsDays(value ?? 'USD');
    return itemSelect = value!;
  }

  @observable
  Color colorLinkEmail = ConstColors.colorLavenderFloral;
  @observable
  Color colorLinkDin = ConstColors.colorLavenderFloral;
  @observable
  Color colorLinkGit = ConstColors.colorLavenderFloral;
  @observable
  Color colorLinkDoc = ConstColors.colorLavenderFloral;
  @observable
  Color colorLinkPolicy = ConstColors.colorLavenderFloral;

  @action
  changesColorLink(String text) {
    switch (text) {
      case ConstString.email:
        return colorLinkEmail = ConstColors.colorSkyMagenta;
      case ConstString.linkDin:
        return colorLinkDin = ConstColors.colorSkyMagenta;
      case ConstString.gitHub:
        return colorLinkGit = ConstColors.colorSkyMagenta;
      case ConstString.docFlutter:
        return colorLinkDoc = ConstColors.colorSkyMagenta;
      case ConstString.policy:
        return colorLinkPolicy = ConstColors.colorSkyMagenta;
    }
  }

  @observable
  Color colorLinkEvaluation = ConstColors.colorLavenderFloral;
  @action
  Color changesColorLinkEvaluation() {
    return colorLinkEvaluation = ConstColors.colorSkyMagenta;
  }

  setFalseProgress() => changesProgressLink(false);

  @observable
  bool progressLink = false;
  @action
  // ignore: avoid_positional_boolean_parameters
  bool changesProgressLink(bool value) => progressLink = value;

  @computed
  // ignore: unnecessary_null_comparison
  bool get isValid => valueToConvert == null;

  String? valueToConvert() {
    if (textValidat.isEmpty) {
      return ConstString.msgRiqueriValue;
    } else {
      changesValueConvertion();
    }
    return null;
  }

  @observable
  String textValidat = '0';
  @action
  String changesTextValidat(String value) => textValidat = value;

  @observable
  String priceCoin = "0";
  @action
  String changesPriceCoin(String value) => priceCoin = value;

  @observable
  String valueConvertion = "0";
  @action
  String changesValueConvertion() {
    if (isReverseConversion) {
      valueConvertion = genFunctions.calcRealToCoin(priceCoin, textValidat)!;
    } else {
      valueConvertion = genFunctions.calcCoinToReal(priceCoin, textValidat)!;
    }

    return valueConvertion;
  }

  @action
  String changesTestIsBitCoin(value) {
    var code = coins!.value?[0].code;
    if (code == "BTC") {
      valueConvertion = genFunctions.formatNumberBitCoin(value)!;
    } else {
      valueConvertion = value;
    }
    return valueConvertion;
  }

  @observable
  bool isReverseConversion = true;
  @action
  bool changesIsReverseConversion() {
    if (isReverseConversion) {
      isReverseConversion = false;
    } else if (isReverseConversion == false) {
      isReverseConversion = true;
    }

    return isReverseConversion;
  }

  @observable
  bool isNet = true;
  @action
  Future<bool> changesIsNet() async {
    isNet = await testInternet.isInternet();
    return isNet;
  }

  Future<void> share(ScreenshotController screenshot) async {
    if (!kIsWeb) {
      await screenshot.capture(delay: const Duration(milliseconds: 10)).then((
        image,
      ) async {
        if (image != null) {
          final directory = await getApplicationDocumentsDirectory();
          final imagePath = await File('${directory.path}/image.png').create();
          await imagePath.writeAsBytes(image);

          await Share.share(imagePath.path, subject: 'My Coins');
        }
      });
    }
  }

  List<CoinsParcModel> fillListSiglas() {
    Iterable interbleCoins = ConstString.listSiglaCoins;
    return interbleCoins.map((coinpmodel) {
      return CoinsParcModel.fromJson(coinpmodel);
    }).toList();
  }

  int textCont({required int text}) {
    int? _cont = int.parse(text.toString());
    if (_cont <= 0) {
      return _cont = 0;
    } else {
      return _cont -= 1;
    }
  }

  final textController = TextEditingController();
  late RateMyAppController rateMyAppController;
  final RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 4,
    minLaunches: 4,
    remindDays: 5,
    remindLaunches: 5,
    googlePlayIdentifier: ConstIDApp.playStoreId,
    appStoreIdentifier: ConstIDApp.appstoreId,
  );

  Future<void> shouldCallAPI() async {
    await changesIsNet();
    if (isNet) {
      fetchCoins(itemSelect);
      fetchcoinsDays(itemSelect);
      changeVersion();
    }
  }
}
