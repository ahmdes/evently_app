import 'package:flutter/material.dart';

class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton({
    super.key,
    required this.nameOfButton,
    required this.onClicked,
  });
  final VoidCallback onClicked;
  final String nameOfButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text(
        nameOfButton,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
