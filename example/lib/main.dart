import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_screen_lock/dot_secret_ui.dart';
import 'package:flutter_screen_lock/lock_screen.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // showAboutDialog(context: null);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Open Lock Screen'),
                onPressed: () => showLockScreen(
                  backgroundColor: Colors.white,
                  numberCircleLineColor: Colors.blueAccent,
                  numberCircleColor: Colors.blue.withOpacity(0.55),
                  description: 'Çocuğunuzun güvenliği için şifre koyun',
                  dotSecretConfig: DotSecretConfig(enabledColor: Colors.green,dotBorderColor: Colors.blue,),
                  dotTextColor: Colors.white,
                  context: context,
                  correctString: '1234',
                  onCompleted: (context, result) {
                    // if you specify this callback,
                    // you must close the screen yourself
                    Navigator.of(context).maybePop();
                  },
                ),
              ),
              RaisedButton(
                child: Text('6 Digits'),
                onPressed: () => showLockScreen(
                  backgroundColor: Colors.redAccent,
                  numberCircleLineColor: Colors.blueAccent,
                  numberCircleColor: Colors.green,
                  description: "asdfghjklşasdfghjkçsrx",
                  dotSecretConfig: DotSecretConfig(enabledColor: Colors.green,dotBorderColor: Colors.blue),
                  context: context,
                  digits: 6,
                  correctString: '123456',
                ),
              ),
              RaisedButton(
                child: Text('Use local_auth'),
                onPressed: () => showLockScreen(
                  backgroundColor: Colors.redAccent,
                  numberCircleLineColor: Colors.blueAccent,
                  numberCircleColor: Colors.green,
                  description: "asdfghjklşasdfghjkçsrx",
                  dotSecretConfig: DotSecretConfig(enabledColor: Colors.green,dotBorderColor: Colors.blue),
                  context: context,
                  correctString: '1234',
                  canBiometric: true,
                  biometricFunction: (context) async {
                    var localAuth = LocalAuthentication();
                    var didAuthenticate =
                        await localAuth.authenticateWithBiometrics(
                            localizedReason:
                                'Please authenticate to show account balance');
                    if (didAuthenticate) {
                      await Navigator.of(context).maybePop();
                    }
                  },
                ),
              ),
              RaisedButton(
                child: Text('Open biometric first'),
                onPressed: () => showLockScreen(
                  backgroundColor: Colors.redAccent,
                  numberCircleLineColor: Colors.blueAccent,
                  numberCircleColor: Colors.green,
                  description: "asdfghjklşasdfghjkçsrx",
                  dotSecretConfig: DotSecretConfig(enabledColor: Colors.green,dotBorderColor: Colors.blue),
                  context: context,
                  correctString: '1234',
                  canBiometric: true,
                  showBiometricFirst: true,
                  biometricFunction: (context) async {
                    var localAuth = LocalAuthentication();
                    var didAuthenticate =
                        await localAuth.authenticateWithBiometrics(
                            localizedReason:
                                'Please authenticate to show account balance');
                    if (didAuthenticate) {
                      await Navigator.of(context).maybePop();
                    }
                  },
                ),
              ),
              RaisedButton(
                child: Text('Can\'t cancel'),
                onPressed: () => showLockScreen(
                  backgroundColor: Colors.redAccent,
                  numberCircleLineColor: Colors.blueAccent,
                  numberCircleColor: Colors.green,
                  description: "asdfghjklşasdfghjkçsrx",
                  dotSecretConfig: DotSecretConfig(enabledColor: Colors.green,dotBorderColor: Colors.blue),
                  context: context,
                  correctString: '1234',
                  canCancel: false,
                ),
              ),
              RaisedButton(
                child: Text('Customize text'),
                onPressed: () => showLockScreen(
                  backgroundColor: Colors.redAccent,
                  numberCircleLineColor: Colors.blueAccent,
                  numberCircleColor: Colors.green,
                  description: "asdfghjklşasdfghjkçsrx",
                  dotSecretConfig: DotSecretConfig(enabledColor: Colors.green,dotBorderColor: Colors.blue),
                  context: context,
                  correctString: '1234',
                  cancelText: 'Close',
                  deleteText: 'Remove',
                ),
              ),
              RaisedButton(
                child: Text('Confirm mode.'),
                onPressed: () => showConfirmPasscode(
                  backgroundColor: Colors.white,
                  numberCircleLineColor: Colors.blueAccent,
                  numberCircleColor: Colors.transparent,
                  dotSecretConfig: DotSecretConfig(
                      enabledColor: Colors.blueAccent,
                      dotBorderColor: Colors.blueAccent,
                  ),
                  context: context,
                  onCompleted: (context, verifyCode) {
                    print(verifyCode);
                    Navigator.of(context).maybePop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
