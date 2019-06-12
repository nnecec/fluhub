import 'package:flutter/cupertino.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoButton(
        child: Text('back'),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
