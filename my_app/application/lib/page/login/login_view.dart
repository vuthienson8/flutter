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
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Positioned.fill(
              child: Container(color: Colors.blue),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height / 3,
              child: Container(color: Colors.white),
            ),
            ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      RaisedButton(
                                        onPressed: () {},
                                        child: Text('Login'),
                                        color: Colors.blue,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Forgot Password?',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
