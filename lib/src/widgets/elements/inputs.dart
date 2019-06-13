import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'Login',
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}

class InputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'Password',
          fillColor: Colors.transparent,
        ),
        obscureText: true,
      ),
    );
  }
}

class InputConfirmPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'Confirm password',
          fillColor: Colors.transparent,
        ),
        obscureText: true,
      ),
    );
  }
}

class InputEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'E-mail',
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
