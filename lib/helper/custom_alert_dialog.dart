import 'package:flutter/material.dart';

enum CustomAlertDialogType { success, danger }

class CustomAlertDialog extends StatelessWidget {
  final Key? key;
  final CustomAlertDialogType type;
  final Function()? onPress;
  final dynamic title;
  final dynamic message;

  const CustomAlertDialog({
    this.key,
    required this.type,
    this.onPress,
    this.title,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: render(),
    );
  }

  Widget render() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(type == CustomAlertDialogType.success ? 0xFF70E27C : 0xFFFF9494).withAlpha(70),
          ),
          child: Icon(
            type == CustomAlertDialogType.success ? Icons.check : Icons.clear,
            size: 60,
            color: Color(type == CustomAlertDialogType.success ? 0xFF2AC769 : 0xFFFF7575),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          child: title is Widget
              ? title
              : Text(
                  '$title',
                ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          width: 200,
          child: message is Widget
              ? message
              : Text(
                  message,
                  textAlign: TextAlign.center,
                ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: 160,
          padding: const EdgeInsets.only(top: 15),
          child: OutlinedButton(
            onPressed: onPress,
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(type == CustomAlertDialogType.success ? 0xFF2AC769 : 0xFFFF7575),
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        )
      ],
    );
  }
}
