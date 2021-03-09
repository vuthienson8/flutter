import 'package:application/page/login/widgets/email_card.dart';
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
              top: MediaQuery.of(context).size.height / 2,
              child: Container(color: Colors.white),
            ),
            ListView(
              padding: EdgeInsets.only(top: 0),
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
                                  EmailCard(
                                    onLoginPressed: (email, password) {
                                      //TODO xu ly dang nhap o day
                                      print('$email, $password');
                                    },
                                    onResetPressed: (email){
                                      print('$email');
                                    },
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
