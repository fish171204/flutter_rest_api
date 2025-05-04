import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    print("fetchUsers call");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return User(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name: name);
    }).toList();
    if (response.statusCode == 200) {
      setState(() {
        users = transformed;
      });
      print('fetchUser completed');
    } else
      print('fail');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Rest API Call',
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
      body: ListView.builder(
          // Dòng này báo cho itemBuilder tạo bao nhiêu phần tử trong ds
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final color = user.gender == 'male' ? Colors.blue : Colors.amber;

            return ListTile(
              title: Text(user.name.first),
              subtitle: Text(user.phone),
              tileColor: color,
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        hoverColor: Colors.amber,
        onPressed: fetchUsers,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
