import 'package:flutter/material.dart';

class MovieDrawerHeader extends StatelessWidget {
  const MovieDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/header.png',scale: 1,),
    );
  }
}
