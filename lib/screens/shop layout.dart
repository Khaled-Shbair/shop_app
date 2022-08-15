import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/string.dart';

import '../getx/shop get.dart';

class ShopLayout extends StatefulWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  State<ShopLayout> createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout> {
  final ShopGet shopGet = Get.put(ShopGet());

  @override
  Widget build(BuildContext context) {
    return GetX<ShopGet>(
      builder: (controller) {
        if (controller.loading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Salla',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, searchScreen);
                },
                icon: const Icon(Icons.search, color: Colors.black),
              ),
            ],
          ),
          body: controller.bottomScreen[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => shopGet.changeBottom(index),
            currentIndex: controller.currentIndex.value,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ],
          ),
        );
      },
    );
  }
}

/*
class _ShopLayoutState extends State<ShopLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit().get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Salla',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, searchScreen);
                },
                icon: const Icon(Icons.search, color: Colors.black),
              ),
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ],
          ),
        );
      },
    );
  }
}
*/
