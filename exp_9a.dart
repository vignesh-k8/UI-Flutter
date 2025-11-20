import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(ApiApp());
}

class ApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Example',
      home: ApiHomePage(),
    );
  }
}

class ApiHomePage extends StatefulWidget {
  @override
  _ApiHomePageState createState() => _ApiHomePageState();
}

class _ApiHomePageState extends State<ApiHomePage> {
  List<dynamic> users = [];

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      setState(() {
        users = jsonDecode(response.body);
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fetch Data from API")),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(user['name'][0]),
                  ),
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                );
              },
            ),
    );
  }
}
