import 'package:flutter/material.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example',
      home: Scaffold(
        appBar: AppBar(title: Text('User Form')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: UserForm(),
        ),
      ),
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Tracks the form state
      child: Column(
        children: [
          // Name Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (value) => name = value,
          ),

          // Email Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => email = value,
          ),

          // Password Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
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
