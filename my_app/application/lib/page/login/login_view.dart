import 'package:application/page/home/home_view.dart';
import 'package:application/page/login/widgets/email_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //fake hàm bất đồng bộ ( Chờ mấy giây rồi đăng nhập )

  // ignore: missing_return
  Future<dynamic> fakeProcess({
    Exception exception,
    Duration duration,
  }) async {
    final _duration = duration ?? Duration(seconds: 2);
    await Future.delayed(_duration);
    if (exception != null) return exception;
    return null;
  }

  bool _isBusy = false;
  set isBusy(value) {
    setState(() {
      _isBusy = value;
    });
  }

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
                                  Visibility(
                                    visible: _isBusy,
                                    child: CircularProgressIndicator(),
                                  ),
                                  Visibility(
                                    visible: !_isBusy,
                                    child: EmailCard(
                                      onLoginPressed: (email, password) async {
                                        //Báo cho view biết trạng thái bận
                                        isBusy = true;
                                        final exception =
                                            Exception('Không thể đăng nhập');
                                        //TODO xu ly dang nhap o day
                                        final result = await fakeProcess();
                                        isBusy = false;
                                        if (result == null)
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(builder: (_) {
                                              return HomeView();
                                            }),
                                          );
                                        else
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: Text(result.message),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop<String>('Ok');
                                                      },
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              }).then((value) {
                                            if (value != null) print(value);
                                          });
                                      },
                                      //onResetPress
                                      onResetPressed: (email) async {
                                        isBusy = true;
                                        final exception =
                                            Exception('Không thể thực hiện');
                                        final result = await fakeProcess(
                                            exception: exception);
                                        isBusy = false;
                                        if (result == null)
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (_) {
                                              return EmailCard();
                                            }),
                                          );
                                        else
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: Text(result.message),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop<String>('Close');
                                                      },
                                                      child: Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              }).then((value) {
                                            if (value != null) print(value);
                                          });
                                      },
                                    ),
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
