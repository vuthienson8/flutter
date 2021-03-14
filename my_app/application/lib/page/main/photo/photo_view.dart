import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Photoview extends StatefulWidget {
  final void Function(String search) onSearch;
  const Photoview({Key key, this.onSearch}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<Photoview> {
  final _onSearch = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Browser'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Photo searching'),
                    content: TextFormField(
                      key: _onSearch,
                      //lay du lieu
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          //lay gia tri nhap vao ve pop
                          final _search = _onSearch.currentState.value;
                          Navigator.of(context).pop('$_search');
                        },
                        child: Text('Search'),
                      )
                    ],
                  );
                },
              ).then((value) {
                //thuc hien lay tu khoa tim kiem
                print(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
