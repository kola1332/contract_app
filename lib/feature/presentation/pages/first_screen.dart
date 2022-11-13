import 'package:flutter/material.dart';

import '../widgets/phones_home_page_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEST'),
        centerTitle: true,
      ),
      body: PhonesHomePageScreen(),
    );
  }
}
