import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getX/shop_getX.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ShopGet _shopGet = Get.put(ShopGet());

  @override
  Widget build(BuildContext context) {
    return GetX<ShopGet>(
      builder: (controller) {
        if (_shopGet.loading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: ListView(
            children: [
              carouselSlider(),
              sizeBox(10),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
                shrinkWrap: true,
                children: [
                  titleCategory(),
                  listCategory(),
                  sizeBox(10),
                  titleProduct(),
                  listProduct(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget carouselSlider() {
    return CarouselSlider(
      items: _shopGet.homeModel!.data.banners.map((e) {
        return Image(
          image: NetworkImage(e.image),
          width: double.infinity,
          fit: BoxFit.cover,
        );
      }).toList(),
      options: CarouselOptions(
          height: 250,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          viewportFraction: 1),
    );
  }

  Widget titleCategory() {
    return const Text(
      'Categories',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget listCategory() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5),
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image(
                image: NetworkImage(
                    _shopGet.category!.dataCategory.data[index].image),
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.black.withOpacity(.8),
                width: 100,
                child: Text(
                  _shopGet.category!.dataCategory.data[index].name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: _shopGet.category!.dataCategory.data.length,
      ),
    );
  }

  Widget titleProduct() {
    return const Text(
      'New Products',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget listProduct() {
    return GridView.builder(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _shopGet.homeModel!.data.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.7,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                      _shopGet.homeModel!.data.products[index].image,
                    ),
                    width: double.infinity,
                    height: 200,
                  ),
                  if (_shopGet.homeModel!.data.products[index].discount != 0)
                    Container(
                      padding:
                          const EdgeInsetsDirectional.only(start: 5, end: 5),
                      color: Colors.red,
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 6,
                  end: 6,
                  top: 5,
                ),
                child: Column(
                  children: [
                    Text(
                      _shopGet.homeModel!.data.products[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.3,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _shopGet.homeModel!.data.products[index].price
                              .toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (_shopGet.homeModel!.data.products[index].discount !=
                            0)
                          Text(
                            _shopGet.homeModel!.data.products[index].oldPrice
                                .toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: Colors.grey,
                            size: 15,
                          ),
                          padding: EdgeInsetsDirectional.zero,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget sizeBox(double height) => SizedBox(height: height);
}
