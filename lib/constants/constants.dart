// ignore_for_file: depend_on_referenced_packages, dead_code

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessages(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const CircularProgressIndicator(
            color: Color.fromARGB(255, 60, 148, 231),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ]),
      );
    }),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE ":
      return "Email already used. Go to login page.";

    case "account-exists-with-different-credential":
      return "Email already used. Go to login page.";

    case "email-already-in-use ":
      return "Email already used. Go to login page.";

    case "ERROR_WORNG_PASSOWRD ":
      return "worng-password";

    case "ERROR_USE_NOR_FOUND":
      return "No userfound in this email";

    case "user-not-found":
      return "No userfound in this email";

    case "ERROR_USER_DISABLED ":
      return "user_disabled";

    case "user_disabled":
      return "User_disabled";

    case "ERROR_TOO_MANY_REQUEST":
      return "Too many requests to log into this account.";

    case "operation-not-allowed":
      return "Too many requests to log into this account.";

    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Too many requests to log into this account.";

    case "ERROR_INVALID_EMAIL":
      return "email address is invalid";

    case "invalid_email":
      return "email address is invalid";

    default:
      return "Loging faild. Please try again.";
  }
}

bool loginVaildation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessages("Both Field are Empty");
    return false;
  } else if (email.isEmpty) {
    showMessages("Email is Empty");
    return false;
  } else if (password.isEmpty) {
    showMessages("passwors is Empty");
    return false;
  } else {
    return true;
  }
}

bool signUpVaildation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessages("All Field are Empty");
    return false;
  } else if (email.isEmpty) {
    showMessages("Email is Empty");
    return false;
  } else if (password.isEmpty) {
    showMessages("Passwors is Empty");
    return false;
  } else if (name.isEmpty) {
    showMessages("Name is Empty");
    return false;
  } else if (phone.isEmpty) {
    showMessages("Phone No is Empty");
    return false;
  } else {
    return true;
  }
}
