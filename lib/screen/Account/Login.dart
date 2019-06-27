import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../../config/app_config.dart';
import '../../config/constant.dart';
import '../../utils/api.dart';
import '../../utils/storage.dart';

class Login extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  Login() {
    flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      print(url);
      if (url.contains('code=')) {
        final code = url.split('code=')[1];
        print(code);
        final res = await api.get(
          'https://github.com/login/oauth/access_token',
          {
            'code': code,
            'client_id': AppConfig.clientID,
            'client_secret': AppConfig.clientSecret,
          },
        );

        print(res);
        final resArray = res.split('&');
        final access_token = resArray[0].split('access_token=')[1];
        final token_type = resArray[2].split('token_type=')[1];
        LocalStorage.setItem(Constant.TOKEN, access_token);
        LocalStorage.setItem(Constant.TOKEN_TYPE, token_type);
      }
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
