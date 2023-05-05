import 'package:task/core/theme/app_dimension.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(color: primaryColor),
          Container(
              margin: const EdgeInsets.only(left: 12),
              child: const Text("Loading...",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: DIMENSION_14,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontNames.robotoMono,
                  ))),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void dismissDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future showScaleAlertBox({
    BuildContext? context,
    Widget? yourWidget,
//    Widget icon,
    Widget? title,
    Widget? firstButton,
    Widget? secondButton,
  }) {
    assert(context != null, "context is null!!");
    assert(yourWidget != null, "yourWidget is null!!");
    assert(firstButton != null, "button is null!!");
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.7),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                title: title,
                actions: <Widget>[
                  firstButton!,
                  const SizedBox(width: 20),
                  secondButton!,
                  const SizedBox(width: 14),
                ],
                actionsPadding: const EdgeInsets.only(bottom: 18),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 250),
        barrierDismissible: false,
        barrierLabel: '',
        context: context!,
        pageBuilder: (context, animation1, animation2) {
          return yourWidget!;
        });
  }

  static buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
