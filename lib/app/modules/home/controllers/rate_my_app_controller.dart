import 'dart:io';

import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../../shared/util/value/const_id_app.dart';

class RateMyAppController {
  final mounted;

  RateMyAppController({required this.mounted});

  void initRate(RateMyApp rateMyApp, BuildContext? context) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await rateMyApp.init();
      if (mounted && rateMyApp.shouldOpenDialog) {
        dailogRate(rateMyApp, context!);
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

      onDismissed: () =>
          rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
      listener: (button) {
        switch (button) {
          case RateMyAppDialogButton.rate:
            setLauchRate(rateMyApp);
            break;
          case RateMyAppDialogButton.later:
            rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed);
            break;
          case RateMyAppDialogButton.no:
            rateMyApp.callEvent(RateMyAppEventType.noButtonPressed);
            break;
        }

        return true; // Return false if you want to cancel the click event.
      },
    );
  }

  void setLauchRate(RateMyApp rateMyApp) async {
    await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
    await rateMyApp.launchStore().then((value) {
      if (value == LaunchStoreResult.errorOccurred) {
        initLaunchReview();
      }
    }).onError((error, stackTrace) {
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

  void dailogStar(RateMyApp rateMyApp, BuildContext context) {
    rateMyApp.showStarRateDialog(
      context,
      title: 'Avaliação My Coins', // The dialog title.
      message: 'Quantas estrela para  My Coins App', // The dialog message.

      actionsBuilder: (context, stars) {
        return [
          TextButton(
            child: Text('OK'),
            onPressed: () async {
              // print(
              //   'Obrigado por ${stars == null ? '0' : stars.round().toString()} star(s) !');
              //Navigator.pop<RateMyAppDialogButton>(
              //    context, RateMyAppDialogButton.rate);
              final launchAppStore = stars! >= 4;
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
  }
}
