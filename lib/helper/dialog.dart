import 'package:app/config/color_config.dart';
import 'package:flutter/material.dart';

import 'custom_alert_dialog.dart';

alertDialog({
  required BuildContext context,
  required dynamic title,
  required dynamic message,
  required CustomAlertDialogType type,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomAlertDialog(
        title: title,
        message: message,
        type: type,
        onPress: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}

Future<void> warningDialog({
  required BuildContext context,
  required Function onPress,
  Function? onCancel,
  required String caption,
  String? okText,
}) async {
  return showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.help,
                  size: 75,
                  color: ColorConfig.primaryLight,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    caption,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    onCancel == null
                        ? Container()
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  if (onCancel != null) onCancel();
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.1),
                                ),
                                child: const Text(
                                  'Tidak',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            onPress();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: ColorConfig.primaryDark,
                          ),
                          child: Text(
                            okText ?? 'Simpan',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

Future<void> dangerDialog({
  required BuildContext context,
  required Function onPress,
  required String caption,
}) async {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  caption,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: OutlinedButton(
                          // padding: const EdgeInsets.symmetric(vertical: 15),
                          // color: Colors.black12.withOpacity(0.1),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Tidak",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TextButton(
                          onPressed: () async {
                            onPress();

                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Ya",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      });
}
