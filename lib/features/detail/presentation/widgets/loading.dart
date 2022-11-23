import 'package:flutter/material.dart';

Widget loadingIndicator() {
  return const Padding(
    padding: EdgeInsets.all(8),
    child: Center(child: CircularProgressIndicator()),
  );
}
