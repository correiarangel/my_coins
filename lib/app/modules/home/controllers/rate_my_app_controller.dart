import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_coins/app/shared/util/value/constants_id_app.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:launch_review/launch_review.dart';

class RateMyAppController {
  final mounted;

  RateMyAppController({required this.mounted});

  void initRate(RateMyApp rateMyApp, BuildContext context) async {
    //debugPrint("##---### @@@@@@@@@ INIT Rate");

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await rateMyApp.init();
      //infoRate(rateMyApp,context);
      if (mounted && rateMyApp.shouldOpenDialog) {
        //debugPrint("##---### entrou 1 if initRate");

        dailogRate(rateMyApp, context);
      }
    });
  }

  void initLaunchReview() {
    LaunchReview.launch(
      androidAppId: ConstIDApp.playStoreId,
      iOSAppId: ConstIDApp.appstoreId,
    );
  }

  T getCondition<T>(_rateMyApp) {
    return _rateMyApp.conditions.whereType<T>().toList().first;
  }

  void dailogRate(RateMyApp rateMyApp, BuildContext context) async {
    await rateMyApp.showRateDialog(
      context,
      title: ConstIDApp.title,
      message: ConstIDApp.message,
      rateButton: ConstIDApp.rateButton,
      noButton: ConstIDApp.noButton,
      laterButton: ConstIDApp.laterButton,
      ignoreNativeDialog: Platform.isAndroid || Platform.isIOS,
      dialogStyle: const DialogStyle(
        titleAlign: TextAlign.center,
        messageAlign: TextAlign.center,
      ), // Estilos de diálogo personalizados.

      onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
          .laterButtonPressed), // Chamado quando o usuário dispensou a caixa de diálogo (gravando externamente ou pressionando o botão "voltar").
      //contentBuilder: (context, defaultContent) => content, // Este permite que você altere o conteúdo da caixa de diálogo padrão.
      // actionsBuilder: (context) => [], // Este permite que você use seus próprios botões.
      listener: (button) {
        //  The button click listener (useful if you want to cancel the click event).
        switch (button) {
          case RateMyAppDialogButton.rate:
            //debugPrint('@@@@  Clicked on "Rate".');
            setLauchRate(rateMyApp);
            break;
          case RateMyAppDialogButton.later:
            //debugPrint('@@@@@  Clicked on "Later".');
            rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed);
            break;
          case RateMyAppDialogButton.no:
            //debugPrint('@@@@@  Clicked on "No".');
            rateMyApp.callEvent(RateMyAppEventType.noButtonPressed);
            break;
        }

        return true; // Return false if you want to cancel the click event.
      },
    );
  }

  void setLauchRate(RateMyApp rateMyApp) async {
    //debugPrint('@@@@  Clicked on "setLauchRate".');
    await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
    await rateMyApp.launchStore().then((value) {
      //debugPrint('@@@@@@ RERULT launchStore *-> $value');
      if (value == LaunchStoreResult.errorOccurred) {
        // print('@@@@ ENTROU NO IF Value - $value');
        initLaunchReview();
      }
    }).onError((error, stackTrace) {
      //debugPrint('@@@@  ERROR - $error');
      initLaunchReview();
    });
  }

/*   void infoRate(RateMyApp rateMyApp,context) {
    final minimumDays = getCondition<MinimumDaysCondition>(rateMyApp);
    final minimumLaunches =
        getCondition<MinimumAppLaunchesCondition>(rateMyApp);
    final doNotOpenAgain = getCondition<DoNotOpenAgainCondition>(rateMyApp);
    var msgToast = Toast(context);
    final openRatingAgain = doNotOpenAgain.doNotOpenAgain ? 'No' : 'Yes';
    msgToast.alert.warning('Launch Qt: ${minimumLaunches.launches}', context);
    debugPrint('## ## Minimo Dias: ${minimumDays.minDays}');
    debugPrint('## ## Relembrar Dias: ${minimumDays.remindDays}');
    debugPrint('## ## Current Launches: ${minimumLaunches.launches}');
    debugPrint('## ## Minimum Launches: ${minimumLaunches.minLaunches}');
    debugPrint('## ## Relembrar Launches: ${minimumLaunches.remindLaunches}');
    debugPrint('## ## Open Rating Again? $openRatingAgain');
  }  */

/*
  void dailogStar(RateMyApp rateMyApp, BuildContext context) {
    // Or if you prefer to show a star rating bar (powered by `flutter_rating_bar`) :

    rateMyApp.showStarRateDialog(
      context,
      title: 'Avaliação Portal Amazonas', // The dialog title.
      message:
          'Quantas estrela você da para Portal Amazonas App', // The dialog message.
      // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.

      actionsBuilder: (context, stars) {
        // Triggered when the user updates the star rating.
        return [
          // Return a list of actions (that will be shown at the bottom of the dialog).
          TextButton(
            child: Text('OK'),
            onPressed: () async {
             // print(
               //   'Obrigado por ${stars == null ? '0' : stars.round().toString()} star(s) !');

              //Navigator.pop<RateMyAppDialogButton>(
              //    context, RateMyAppDialogButton.rate);

              final launchAppStore = stars >= 4;
              final event = await RateMyAppEventType.rateButtonPressed;

              rateMyApp.callEvent(event);

              if (launchAppStore) {
                rateMyApp.launchStore();
              }

              Navigator.of(context).pop();
            },
          ),
        ];
      },
      ignoreNativeDialog: Platform.isAndroid,
      dialogStyle: const DialogStyle(
        // Custom dialog styles.
        titleAlign: TextAlign.center,
        messageAlign: TextAlign.center,
        messagePadding: EdgeInsets.only(bottom: 20),
      ),

      starRatingOptions: StarRatingOptions(initialRating: 4),
      //starRatingOptions: const StarRatingOptions(), // Custom star bar rating options.
      onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
          .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
    );
  }*/
}
