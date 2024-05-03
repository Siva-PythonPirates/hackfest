import 'package:flutter/material.dart';

import 'admin.dart';
import 'main.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
                bool isAdmin = checkAdminCredentials(username, password);
                if (isAdmin) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminDashboard(alertMessages: [])),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Body()),
                  );
                }

              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  bool checkAdminCredentials(String username, String password) {
    return username == 'admin' && password == 'admin123';
  }
}
