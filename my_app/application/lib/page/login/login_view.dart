import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(), //tao background
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: 500,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Column(
                            children: [
                              TextFormField(
                                key: Key('email'),
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    icon: Icon(Icons.email_outlined)),
                              ),
                              TextFormField(
                                key: Key('password'),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  icon: Icon(Icons.security),
                                ),
                                obscureText: true,
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RaisedButton(
                                    onPressed: () {},
                                    child: Text('Login'),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('Forgot Password?'))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
