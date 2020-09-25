import 'package:flutter/material.dart';

Container circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top:10),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Color(0xFFA30003)),
    ),
  );
}

Container linearProgress() {
  return Container(
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.only(bottom: 10),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Color(0xFFA30003)),
      backgroundColor: Colors.grey,
    ),
  );
}
