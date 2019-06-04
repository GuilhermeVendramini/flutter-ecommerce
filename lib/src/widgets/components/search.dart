import 'package:flutter/material.dart';

Widget searchInput(context) {
  return TextField(
    onSubmitted: (value) {
      Navigator.pushReplacementNamed(context, '/');
    },
    autofocus: true,
    decoration: const InputDecoration(
      hintText: 'Search...',
      border: InputBorder.none,
    ),
    style: const TextStyle(color: Colors.white, fontSize: 16.0),
  );
}