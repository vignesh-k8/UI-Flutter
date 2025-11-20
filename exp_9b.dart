import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(ApiCardApp());
}

class ApiCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Card Example',
      home: ApiCardPage(),
    );
  }
}

class ApiCardPage extends StatefulWidget {
  @override
  _ApiCardPageState createState() => _ApiCardPageState();
}

class _ApiCardPageState extends State<ApiCardPage> {
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
      appBar: AppBar(title: Text("Users List")),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text(user['name'][0],
                          style: TextStyle(color: Colors.white)),
                    ),
                    title: Text(user['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email: ${user['email']}"),
                        Text("Phone: ${user['phone']}"),
                        Text("Company: ${user['company']['name']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
