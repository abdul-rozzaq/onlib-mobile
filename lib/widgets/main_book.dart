import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainBook extends StatefulWidget {
  const MainBook({
    super.key,
  });

  @override
  State<MainBook> createState() => _MainBookState();
}

class _MainBookState extends State<MainBook> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFD0D0D0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: 120,
        height: 180,
      ),
    );
  }
}
