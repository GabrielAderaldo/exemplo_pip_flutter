import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pip extends StatelessWidget {
  const Pip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String viewType = "ios-pip";
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return Center(
      child: Container(
        width: 400,
        height: 400,
        color: Colors.amber,
        child: UiKitView(viewType: viewType),
      ),
    );
  }
}
