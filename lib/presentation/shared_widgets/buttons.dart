import 'package:flutter/material.dart';

class Buttons {
  static Widget expandedFlatButton(Function()? callback, String buttonText) =>
      SizedBox(
        width: double.maxFinite,
        child: TextButton(
          onPressed: callback,
          child: const Text("Submit"),
        ),
      );
  static Widget whiteElevatedButton(
          Function()? callback, String buttonText, BuildContext context) =>
      ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          buttonText,
          style:
              TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
        ),
      );
}
