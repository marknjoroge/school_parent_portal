import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:school_app/reset_password.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return users[name]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Parent Portal',
      // logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResetPassword(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      userType: LoginUserType.name,
      messages: LoginMessages(
        userHint: 'Student ID',
        passwordHint: 'Password (Your ID)',
        recoverPasswordDescription: ''
      ),
    );
  }
}