import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/bloc/shop%20bloc/shop%20get.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ShopGet shopGet = Get.put(ShopGet());

  @override
  Widget build(BuildContext context) {
    return GetX<ShopGet>(
      init: shopGet,
      global: true,
      builder: (controller) {
        if (controller.loading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: ListView(
            children: [
              CarouselSlider(
                items: ShopGet.to.homeModel.data.banners.map((e) {
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
              ),
              const SizedBox(height: 10),
              //  list(controller),
              GridView.builder(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ShopGet.to.homeModel.data.products.length,
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
                                ShopGet.to.homeModel.data.products[index].image,
                              ),
                              width: double.infinity,
                              height: 200,
                            ),
                            if (ShopGet.to.homeModel.data.products[index]
                                    .discount !=
                                0)
                              Container(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5, end: 5),
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
                                ShopGet.to.homeModel.data.products[index].name,
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
                                    ShopGet
                                        .to.homeModel.data.products[index].price
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  if (ShopGet.to.homeModel.data.products[index]
                                          .discount !=
                                      0)
                                    Text(
                                      ShopGet.to.homeModel.data.products[index]
                                          .oldPrice
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  const Spacer(),
                                  CircleAvatar(
                                    backgroundColor: ShopGet.to.listFavorites[
                                            controller.homeModel.data
                                                .products[index].id]!
                                        ? Colors.blue
                                        : Colors.grey,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      padding: EdgeInsetsDirectional.zero,
                                    ),
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
              ),
            ],
          ),
        );
      },
    );
  }

/*
@override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ShopLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        var cubit = ShopCubit().get(context);
        return Scaffold(
          body: ListView(
            children: [
              CarouselSlider(
                items: cubit.homeModel.data.banners.map((e) {
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
              ),
              const SizedBox(height: 10),
              list(cubit),
              GridView.builder(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cubit.homeModel.data.products.length,
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
                                cubit.homeModel.data.products[index].image,
                              ),
                              width: double.infinity,
                              height: 200,
                            ),
                            if (cubit.homeModel.data.products[index].discount !=
                                0)
                              Container(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5, end: 5),
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
                                cubit.homeModel.data.products[index].name,
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
                                    cubit.homeModel.data.products[index].price
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  if (cubit.homeModel.data.products[index]
                                          .discount !=
                                      0)
                                    Text(
                                      cubit.homeModel.data.products[index]
                                          .oldPrice
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  const Spacer(),

                                  CircleAvatar(
                                    backgroundColor: cubit.listFavorites[cubit
                                            .homeModel.data.products[index].id]!
                                        ? Colors.blue
                                        : Colors.grey,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      padding: EdgeInsetsDirectional.zero,
                                    ),
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
              ),
            ],
          ),
        );
        },
    );
  }
 */
  Widget list(ShopGet cubit) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      shrinkWrap: true,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Container(
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
                        cubit.category.dataCategory.data[index].image),
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.8),
                    width: 100,
                    child: Text(
                      cubit.category.dataCategory.data[index].name,
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
            itemCount: cubit.category.dataCategory.data.length,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'New Products',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
