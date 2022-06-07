import 'package:flutter/material.dart';

final appBar = AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  leading: const Icon(Icons.menu, color: Colors.black54),
  actions: const [
    Padding(
      padding: EdgeInsets.only(right: 23.0),
      child: Icon(Icons.person_add_alt_1_rounded, color: Colors.black54),
    ),
  ],
);
