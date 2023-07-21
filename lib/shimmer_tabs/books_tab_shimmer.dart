// ignore_for_file: void_checks, prefer_typing_uninitialized_variables, must_be_immutable, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:shimmer/shimmer.dart';

class BooksShimmer extends StatefulWidget {
  const BooksShimmer({
    super.key,
  });

  @override
  State<BooksShimmer> createState() => _BooksShimmerState();
}

class _BooksShimmerState extends State<BooksShimmer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onrefresh,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'For you',
                style: TextStyle(
                    color: Colors.black, fontSize: 25, fontFamily: 'Lobster'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const SliderBookShimmer(),
                itemCount: 10,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Popular Books',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 25,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 38,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => const CategoryShimmer(),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 250,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (_, index) => const MainBookShimmer(),
                itemCount: 15,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onrefresh() async {
    print('refresh');
  }
}

class SliderBookShimmer extends StatelessWidget {
  const SliderBookShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.black12, borderRadius: BorderRadius.circular(10)),
          //   height: 180,
          //   width: 120,
          // ),
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 216, 216, 216),
            highlightColor: const Color.fromARGB(255, 197, 197, 197),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: 180,
              width: 120,
            ),
          ),
          const SizedBox(height: 5),
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 216, 216, 216),
            highlightColor: const Color.fromARGB(255, 197, 197, 197),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: 20,
              width: 80,
            ),
          ),
          const SizedBox(height: 3),
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 216, 216, 216),
            highlightColor: const Color.fromARGB(255, 197, 197, 197),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: 20,
              width: 60,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 216, 216, 216),
      highlightColor: const Color.fromARGB(255, 197, 197, 197),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        width: 80,
      ),
    );
  }
}

class MainBookShimmer extends StatelessWidget {
  const MainBookShimmer({
    super.key,
  });

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
