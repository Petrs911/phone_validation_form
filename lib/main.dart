import 'package:flutter/material.dart';

import 'package:phone_validation_form/pages/phone_validation_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneValidationForm(),
    );
  }
}
