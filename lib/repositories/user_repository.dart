import 'package:flutter/material.dart';

class UserRepository {
  Future<String> authenticate(
      {@required String username, @required String password}) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return null;
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return;
  }

  Future<void> saveToken() async {
    await Future.delayed(Duration(milliseconds: 1000));
    print('save token');
    return null;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return false;
  }
}
