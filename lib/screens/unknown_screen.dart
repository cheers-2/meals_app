import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  static const routeName = '/unknown-screen';
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Error')),
      body: Center(
        child: Text('Halaman Error'),
      ),
    );
  }
}
