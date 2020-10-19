import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic-Tac-Toe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _turn = true;

  var _board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  void _winnerCheck(int x, int y, BuildContext context) {
    setState(() {
      if (_board[x][y] == '') {
        _board[x][y] = _turn ? 'o' : 'x';
        _turn = !_turn;
      }
    });

    if (!_board[x].contains('')) {
      print(_board);
      if (_board[x].every((element) => element == _board[x][0])) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Selesai'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  !_turn ? Icons.radio_button_unchecked : Icons.clear,
                  color: !_turn ? Colors.green : Colors.red,
                  size: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                const Text('Menang'),
              ],
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _board = [
                      ['', '', ''],
                      ['', '', ''],
                      ['', '', ''],
                    ];
                  });
                },
                child: Text('Main Lagi'),
              ),
            ],
          ),
        );
      }
    }

    if (_board[0][y] != '' && _board[1][y] != '' && _board[2][y] != '') {
      if (_board[0][y] == _board[1][y] && _board[0][y] == _board[2][y]) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Selesai'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  !_turn ? Icons.radio_button_unchecked : Icons.clear,
                  color: !_turn ? Colors.green : Colors.red,
                  size: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                const Text('Menang'),
              ],
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _board = [
                      ['', '', ''],
                      ['', '', ''],
                      ['', '', ''],
                    ];
                  });
                },
                child: Text('Main Lagi'),
              ),
            ],
          ),
        );
      }
    }

    if (_board[0][0] != '' && _board[1][1] != '' && _board[2][2] != '') {
      if (_board[0][0] == _board[1][1] && _board[0][0] == _board[2][2]) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Selesai'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  !_turn ? Icons.radio_button_unchecked : Icons.clear,
                  color: !_turn ? Colors.green : Colors.red,
                  size: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                const Text('Menang'),
              ],
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _board = [
                      ['', '', ''],
                      ['', '', ''],
                      ['', '', ''],
                    ];
                  });
                },
                child: Text('Main Lagi'),
              ),
            ],
          ),
        );
      }
    }

    if (_board[0][2] != '' && _board[1][1] != '' && _board[2][0] != '') {
      if (_board[0][2] == _board[1][1] && _board[0][2] == _board[2][0]) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Selesai'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  !_turn ? Icons.radio_button_unchecked : Icons.clear,
                  color: !_turn ? Colors.green : Colors.red,
                  size: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                const Text('Menang'),
              ],
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _board = [
                      ['', '', ''],
                      ['', '', ''],
                      ['', '', ''],
                    ];
                  });
                },
                child: Text('Main Lagi'),
              ),
            ],
          ),
        );
      }
    }

    if (!_board[0].contains('') &&
        !_board[1].contains('') &&
        !_board[2].contains('')) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Selesai'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Seri'),
            ],
          ),
          actions: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _board = [
                    ['', '', ''],
                    ['', '', ''],
                    ['', '', ''],
                  ];
                });
              },
              child: Text('Main Lagi'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Giliran ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Icon(
                _turn ? Icons.radio_button_unchecked : Icons.clear,
                color: _turn ? Colors.green : Colors.red,
                size: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(0, 0, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[0][0] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[0][0] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(0, 1, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[0][1] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[0][1] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(0, 2, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[0][2] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[0][2] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(1, 0, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[1][0] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[1][0] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(1, 1, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[1][1] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[1][1] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(1, 2, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[1][2] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[1][2] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(2, 0, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[2][0] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[2][0] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(2, 1, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[2][1] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[2][1] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    _winnerCheck(2, 2, context);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: _board[2][2] == 'o'
                        ? Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.green,
                            size: 70,
                          )
                        : _board[2][2] == 'x'
                            ? Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 70,
                              )
                            : Container(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
