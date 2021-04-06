import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigationPush(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
}

void navigationPushReplacement(BuildContext context, Widget widget) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => widget));
}
