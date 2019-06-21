import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      // url: 'https://www.baidu.com/',
      url:
          'https://github.com/login/oauth/authorize?client_id=ef3401c386520ee519d5',
      appBar: CupertinoNavigationBar(
        middle: Text('Login with GitHub'),
      ),
    );
  }
}
