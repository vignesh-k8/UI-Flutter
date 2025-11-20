import 'package:flutter/material.dart';

void main() {
  runApp(FormValidationApp());
}

class FormValidationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Form Validation')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ValidationForm(),
        ),
      ),
    );
  }
}

class ValidationForm extends StatefulWidget {
  @override
  _ValidationFormState createState() => _ValidationFormState();
}

class _ValidationFormState extends State<ValidationForm> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Name Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            onSaved: (value) => name = value,
          ),

          // Email Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!value.contains('@')) {
                return 'Enter a valid email';
              }
              return null;
            },
            onSaved: (value) => email = value,
          ),

          // Password Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            onSaved: (value) => password = value,
          ),

          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form Submitted Successfully!')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
