import 'dart:core';



class FullNameValidator {
  // Make your value nullable
  static bool validate(String? value) {
    bool message = false;
    // Now that value can be null you cannot be sure that isEmpty can be called
    // so you need to provide a default value, in this case I am returning
    // true if isEmpty cannot be called so it will return 'Please enter full name'.
    if (value?.isEmpty ?? true) {
      message = true;
    }
    if (value?.isNotEmpty ?? true) {
      message = true;
    }
    return message;
  }
}

class Counter {
  int value = 1;
  void increment() => value++;
  void decrement() => value--;
}

class PinCodeValidator {
  // Make your value nullable
  static bool validate(String? value) {
    bool message = false;
    // Now that value can be null you cannot be sure that isEmpty can be called
    // so you need to provide a default value, in this case I am returning
    // true if isEmpty cannot be called so it will return 'Please enter full name'.
    if (value == "1234") {
      message = true;
    }
    if (value == "22222") {
      message = true;
    }
    if (value == "") {
      message = true;
    }
    return message;
  }
}

DateTime SystemTime() {
  var clientTime = DateTime.now().toUtc();
  return clientTime;
}

// int? ServerTime() {
//   //  initPlatformState();
//   // //int? serverTime = currentNtpTimeMs;
//   // //int? serverTime = await FlutterKronos.getCurrentTimeMs;
//   // //currentNtpTimeMs =  FlutterKronos.getCurrentNtpTimeMs ;
//   // //currentNtpTimeMs = serverTimentp;
//   int? serverTime = currentNtpTimeMs;
//   return serverTime;
// }
// // Future<void> initPlatformState() async {
// //   // Platform messages may fail, so we use a try/catch PlatformException.
// //   FlutterKronos.sync();
// //   try {
// //     int? _currentTimeMs = await FlutterKronos.getCurrentTimeMs;
// //     int? _currentNtpTimeMs = await FlutterKronos.getCurrentNtpTimeMs;
// //     currentNtpTimeMs = _currentNtpTimeMs;
// //     var localtime = _currentNtpTimeMs.toString();
// //     //var datet = localtime
// //   } on PlatformException {}
// // }
//
// bool compareTime() {
//   bool message = false;
//   var serverTime =
//       currentNtpTimeMs; // not yet existing method to fetch the date and time from the server
//   var clientTime = DateTime.now().toUtc();
//   if (serverTime != clientTime) {
//     message = true;
//   } else {
//     message = false;
//   }
//   return message;
// }
