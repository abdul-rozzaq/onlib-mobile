import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlib/config.dart';
import 'package:onlib/shimmer_tabs/books_tab_shimmer.dart';
import 'package:onlib/tabs/bag_tab.dart';
import 'package:onlib/tabs/books_tab.dart';
import 'package:onlib/tabs/bookshelf_tab.dart';
import 'package:onlib/tabs/wishlist_tab.dart';
import 'package:onlib/widgets/appbar.dart';
import 'package:onlib/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../providers/homepage_provider.dart';
import '../tabs/account_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 30;

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<HomePageVM>(context, listen: false);

    // provider.updateToken();
    provider.getUser(context);
    provider.getCategories();
    provider.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageVM>(context, listen: true);

    return Scaffold(
      appBar: const CAppBar(),
      drawer: const CDrawer(),
      body: [
        !provider.isLoadingBook &&
                !provider.isLoadingCategory &&
                !provider.isLoadingUser
            ? Books(provider: provider)
            : const BooksShimmer(),
        const Bookshelf(),
        const Wishlist(),
        const Bag(),
        AccountTab(provider: provider),
      ][provider.index],
      bottomNavigationBar: BottomBarFloating(
        items: [
          const TabItem(
            icon: Icons.menu_book,
            title: 'Books',
          ),
          const TabItem(
            icon: Icons.shelves,
            title: 'Bookshelf',
          ),
          TabItem(
            icon: provider.index == 2
                ? CupertinoIcons.heart_fill
                : CupertinoIcons.heart,
            title: 'Wishlist',
            // title: 'Shop',
          ),
          TabItem(
            icon: provider.index == 3
                ? Icons.chat
                : Icons.chat_outlined,
            title: 'Chat',
            // title: 'Wishlist',
          ),
          TabItem(
            icon: provider.index == 4 ? Icons.person : Icons.person_outlined,
            title: 'Account',
            // title: 'Wishlist',
          ),
        ],
        duration: const Duration(seconds: 0),
        titleStyle: const TextStyle(fontFamily: 'Lobster', fontSize: 15),
        backgroundColor: Colors.white,
        color: greenColor2,
        colorSelected: greenColor,
        indexSelected: provider.index,
        borderRadius: BorderRadius.circular(10),
        enableShadow: true,
        paddingVertical: 10,
        onTap: (int index) => provider.updateIndex(index),
      ),
    );
  }
}
