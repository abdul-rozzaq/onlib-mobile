// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlib/screens/book_review.dart';
import 'package:text_scroll/text_scroll.dart';

import '../models/book_model.dart';

class SliderBook extends StatefulWidget {
  Book book;

  SliderBook({super.key, required this.book});

  @override
  State<SliderBook> createState() => _SliderBookState();
}

class _SliderBookState extends State<SliderBook> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BookReview(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.black12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/SocialMedia.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white54,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Lobster',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      size: 20,
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      size: 20,
                                      Icons.star,
                                      color: Colors.amber,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white54,
                          ),
                          child: Icon(
                            isLiked
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 7),
            TextScroll(
              widget.book.name,
              style: const TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                fontFamily: 'Lobster',
              ),
              velocity: const Velocity(pixelsPerSecond: Offset(150, 0)),
              // delayBefore: const Duration(milliseconds: 500),
              numberOfReps: 5,
              pauseBetween: const Duration(milliseconds: 3),
              textAlign: TextAlign.right,
              selectable: true,
            ),
            Text(
              '${widget.book.author.firstName} ${widget.book.author.lastName}',
              style: const TextStyle(
                letterSpacing: 1,
                fontSize: 12,
                fontFamily: 'Lobster',
              ),
            )
          ],
        ),
      ),
    );
  }
}
