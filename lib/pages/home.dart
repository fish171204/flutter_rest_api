import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/services/user_api.dart';

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

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
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
            // final color = user.gender == 'male' ? Colors.blue : Colors.amber;

            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.phone),
              // tileColor: color,
            );
          }),
    );
  }
}
