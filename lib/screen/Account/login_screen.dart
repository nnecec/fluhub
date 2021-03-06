import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import '../../config/app_config.dart';
import '../../config/constant.dart';
import '../../utils/api.dart';
import '../../utils/storage.dart';
import './redux/action.dart';
import '../../store/store.dart';

class LoginScreen extends StatelessWidget {
  FlutterWebviewPlugin flutterWebviewPlugin;

  LoginScreen(context) {
    flutterWebviewPlugin = FlutterWebviewPlugin();
    flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      // await flutterWebviewPlugin.cleanCookies();
      print('onUrlChanged: $url');
      if (url.contains('code=')) {
        final code = url.split('code=')[1];

        final res = await api.get(
          'https://github.com/login/oauth/access_token',
          {
            'code': code,
            'client_id': AppConfig.clientID,
            'client_secret': AppConfig.clientSecret,
          },
        );

        if (res.data.contains('access_token=')) {
          final resArray = res.data.split('&');
          final accessToken = resArray[0].split('access_token=')[1];
          final tokenType = resArray[2].split('token_type=')[1];

          LocalStorage.setItem(Constant.TOKEN, accessToken);
          LocalStorage.setItem(Constant.TOKEN_TYPE, tokenType);
          Navigator.pop(context);

          store.dispatch(SetAccessTokenAction(accessToken));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url:
          'https://github.com/login/oauth/authorize?client_id=${AppConfig.clientID}',
      // clearCookies: true,
      // clearCache: true,
      appBar: CupertinoNavigationBar(
        middle: Text('Login with GitHub'),
      ),
    );
  }
}
