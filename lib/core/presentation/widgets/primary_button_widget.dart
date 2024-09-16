import 'package:flutter/material.dart';
import 'package:mvvm_project/core/enums.dart';

//ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  ButtonType type;
  String title;
  Widget? icon;
  Function() action;

  PrimaryButton({
    super.key,
    required this.action,
    this.title = "Hello",
    this.icon,
    this.type = ButtonType.filled,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.filled:
        return FilledButton.icon(
          onPressed: action,
          icon: icon,
          label: buttonBody(context),
        );
      case ButtonType.elevated:
        return ElevatedButton.icon(
            icon: icon, onPressed: action, label: buttonBody(context));
      case ButtonType.outlined:
        return OutlinedButton.icon(
            icon: icon, onPressed: action, label: buttonBody(context));
      case ButtonType.text:
        return TextButton.icon(
            onPressed: action, icon: icon, label: buttonBody(context));
      default:
        return FilledButton.icon(
            onPressed: action, icon: icon, label: buttonBody(context));
    }
  }

  Widget buttonBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
      ],
    );
  }
}
