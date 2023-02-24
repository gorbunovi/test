import 'package:flutter/material.dart';

class PreViewWidget extends StatelessWidget {
  const PreViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/pre.png',
          // fit: BoxFit.fitWidth,
          height: MediaQuery.of(context).size.height,
          // width: _sizePhoto,
        ),
      ),
    );
  }
}
