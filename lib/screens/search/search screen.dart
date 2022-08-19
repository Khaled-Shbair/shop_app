import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/getX/search_get.dart';

import '../../widgets/input filed.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchGet _searchGet = Get.put(SearchGet());
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetX<SearchGet>(
        builder: (controller) {
          if (_searchGet.loading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsetsDirectional.all(40),
            children: [
              searchField(),
              const SizedBox(height: 40),
              list(),
            ],
          );
        },
      ),
    );
  }

  Widget searchField() {
    return TextField(
      controller: _searchController,
      keyboardType: TextInputType.text,
      onSubmitted: (value) => _searchGet.search(value),
      decoration: InputDecoration(
        hintText: 'Enter text to search',
        prefixIcon: const Icon(Icons.search),
        helperStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget list() {
    if (_searchGet.searchModel != null) {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        image: NetworkImage(
                          _searchGet.searchModel!.data!.data![index].image,
                        ),
                        width: 120,
                        height: 120,
                      ),
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
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _searchGet.searchModel!.data!.data![index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            _searchGet.searchModel!.data!.data![index].price
                                .toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Spacer(),
                          CircleAvatar(
                            radius: 15,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Colors.grey,
                                size: 15,
                              ),
                              padding: EdgeInsetsDirectional.zero,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
            thickness: 2,
          );
        },
        itemCount: _searchGet.searchModel!.data!.data!.length,
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
