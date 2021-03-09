import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmaiCardStatus { login, reset }

class EmailCard extends StatefulWidget {
  final void Function(String email, String password) onLoginPressed;
  final void Function(String email) onResetPressed;
  const EmailCard({Key key, this.onLoginPressed, this.onResetPressed})
      : super(key: key);

  

  @override
  State<StatefulWidget> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  var _status = EmaiCardStatus.login;
  set status(value) {
    setState(() {
      _status = value;
    });
  }

  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  final _resetEmailKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Login view
        Visibility(
          visible: _status == EmaiCardStatus.login,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đăng nhập',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Divider(),
              TextFormField(
                key: _emailKey,
                decoration: InputDecoration(
                    labelText: 'Email', icon: Icon(Icons.email_outlined)),
                validator: (value) {
                  if (!value.contains('@')) return 'Email không hợp lệ';
                  return null;
                },
              ),
              TextFormField(
                key: _passwordKey,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  icon: Icon(Icons.security),
                ),
                obscureText: true,
                validator: (value) {
                  if (value.length < 6) return 'Mật khẩu không hợp lệ';
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_emailKey.currentState.validate() &&
                          _passwordKey.currentState.validate()) {
                        final _email = _emailKey.currentState.value;
                        final _password = _passwordKey.currentState.value;
                        widget.onLoginPressed(_email, _password);
                      }
                    },
                    child: Text('Đăng nhập'),
                  ),
                  TextButton(
                    onPressed: () => status = EmaiCardStatus.reset,
                    child: Text(
                      'Quên mật khẩu?',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        //Password restore
        Visibility(
          visible: _status == EmaiCardStatus.reset,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lấy lại mật khẩu',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Divider(),
              TextFormField(
                key: _resetEmailKey,
                decoration: InputDecoration(
                    labelText: 'Email', icon: Icon(Icons.email_outlined)
                ),
                validator: (value) {
                  if (!value.contains('@')) return 'Email không hợp lệ';
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_resetEmailKey.currentState.validate()) {
                        final _resetEmail = _resetEmailKey.currentState.value;
                        widget.onResetPressed(_resetEmail);
                      }
                    },
                    child: Text('Khôi phục'),
                  ),
                  RaisedButton(
                    onPressed: () => status = EmaiCardStatus.login,
                    child: Text('Bỏ qua'),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
