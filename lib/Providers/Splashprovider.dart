import 'package:flutter/material.dart';

class SplashScreenProvider with ChangeNotifier {
  bool _isloading = true;
  bool get isloading => _isloading;

  SplashScreenProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(Duration(seconds: 4));
    _isloading = false;
    notifyListeners();
  }
}
