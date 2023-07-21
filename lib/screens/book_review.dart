import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlib/config.dart';

class BookReview extends StatelessWidget {
  const BookReview({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Book review',
          style: TextStyle(color: blackColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: blackColor,
            icon: const Icon(
              CupertinoIcons.ellipsis_vertical,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/SocialMedia.jpg',
                      width: width * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SelectableText(
                          'Social media',
                          style: TextStyle(fontFamily: 'Lobster', fontSize: 25),
                        ),
                        SelectableText.rich(
                          TextSpan(
                            style: const TextStyle(fontFamily: 'Lobster'),
                            children: [
                              TextSpan(
                                text: 'by ',
                                style: TextStyle(color: greenColor),
                              ),
                              TextSpan(
                                text: 'Abdurazzoq Abdusalomov',
                                style: TextStyle(
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: double.maxFinite,
                  child: const Center(
                    child: Text(
                      'Add to bookshelf',
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
