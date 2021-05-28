import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneValidationForm extends StatefulWidget {
  PhoneValidationForm({Key? key}) : super(key: key);

  @override
  _PhoneValidationFormState createState() => _PhoneValidationFormState();
}

class _PhoneValidationFormState extends State<PhoneValidationForm> {
  TextEditingController _phoneController = TextEditingController();

  final _maskFormatter = MaskTextInputFormatter(mask: ('(###) ###-####'));

  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Get Started',
              style: Theme.of(context).textTheme.headline5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [_maskFormatter],
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: '(201) 555-0123',
                  helperText: 'Enter your phone number',
                  suffixIcon: _phoneNumber.isEmpty
                      ? null
                      : IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() => _phoneNumber = '');
                            _phoneController.clear();
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        backgroundColor: _phoneNumber.length == 14 ? Colors.blue : Colors.grey,
        onPressed: _phoneNumber.length == 14
            ? () => _showDialog(
                  'Conrats!',
                  'Number: ${_phoneController.text} was saved.',
                )
            : null,
      ),
    );
  }

  void _showDialog(String title, String text) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
