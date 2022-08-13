import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/shop%20bloc/shop%20cubit.dart';
import 'package:shop_app/bloc/shop%20bloc/shop%20states.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
              listProduct(cubit),
            ],
          ),
        );
      },
    );
  }

  Widget listProduct(ShopCubit cubit) {
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cubit.homeModel.data.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.6,
        ),
        itemBuilder: (context, index) {
          return Image(
            image: NetworkImage(
              cubit.homeModel.data.products[index].image,
            ),
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
