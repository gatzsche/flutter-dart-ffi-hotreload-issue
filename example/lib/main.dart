import 'package:flutter/material.dart';
import 'package:flutter_dart_ffi_hotreload_issue/flutter_dart_ffi_hotreload_issue.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isStarted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hot Reload Issue Demo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    _isStarted
                        ? 'Running ... => Hot Reload is broken. We need a callback that informs us *before* an hot reload is exectued. In that case we could call stop and interrupt the long running process.'
                        : 'Stopped ... => Hot Reload is Working',
                    style: TextStyle(
                        color: _isStarted ? Colors.red : Colors.green[600],
                        fontWeight: FontWeight.bold),
                  )),
              Expanded(child: Container()),
              Expanded(
                  child: FlatButton(
                      color: Colors.cyan,
                      onPressed: () async {
                        if (!_isStarted) {
                          await FlutterDartFfiHotreloadIssue.start();
                        } else {
                          await FlutterDartFfiHotreloadIssue.stop();
                        }

                        setState(() {
                          _isStarted = !_isStarted;
                        });

                        /// Here the long running process is started
                      },
                      child: Text(_isStarted ? 'Stop' : 'Start'))),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
