import 'package:flutter/material.dart';
class Lestest extends StatefulWidget {
  const Lestest({super.key});

  @override
  State<Lestest> createState() => _LestestState();
}

class _LestestState extends State<Lestest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("test"),
        centerTitle: true,
      ),
    );
  }
}