import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../../config/app_config.dart';

class Login extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  Login() {
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url:
          'https://github.com/login/oauth/authorize?client_id=${AppConfig.clientID}',
      appBar: CupertinoNavigationBar(
        middle: Text('Login with GitHub'),
      ),
    );
  }
}
