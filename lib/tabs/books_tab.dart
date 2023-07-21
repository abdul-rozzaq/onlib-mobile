// ignore_for_file: void_checks, prefer_typing_uninitialized_variables, must_be_immutable, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:onlib/providers/homepage_provider.dart';
import 'package:onlib/widgets/list_category.dart';
import 'package:onlib/widgets/slider_book.dart';

import '../widgets/main_book.dart';

class Books extends StatefulWidget {
  Books({super.key, required this.provider});

  HomePageVM provider;

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  var selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => widget.provider.getCategories(),
      child: !widget.provider.isLoadingCategory
          ? SingleChildScrollView(
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
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Lobster'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // const SingleChildScrollView(
                  //   padding: EdgeInsets.symmetric(horizontal: 5),
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       SliderBook(),
                  //       SliderBook(),

                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SliderBook(book: widget.provider.books[index]),
                      itemCount: widget.provider.books.length,
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
                          fontFamily: 'Lobster'),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15.0),
                  //   child: SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: ListView(
                  //       shrinkWrap: true,
                  //       children: [
                  //         Category(
                  //             type: 'All',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //         Category(
                  //             type: 'Adventure stories',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //         Category(
                  //             type: 'Classics',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //         Category(
                  //             type: 'Crime',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //         Category(
                  //             type: 'Fairy tales',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //         Category(
                  //             type: 'Fantasy',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //         Category(
                  //             type: 'Historical fiction',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //         Category(
                  //             type: 'Horror',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //         Category(
                  //             type: 'Humour and satire',
                  //             updateCategory: updateSelectedCategory,
                  //             selectedCategory: selectedCategory),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 38,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.provider.categories.length,
                      itemBuilder: (context, index) => Category(
                        type: widget.provider.categories[index].name,
                        updateCategory: updateSelectedCategory,
                        selectedCategory: selectedCategory,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GridView(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      children: const [
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                        MainBook(),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: greenColor,
              ),
            ),
    );
  }

  void updateSelectedCategory(String category) {
    print(category);
    setState(() {
      selectedCategory = category;
    });
  }

  Future<void> _onrefresh() async {
    print('refresh');
  }
}
