class HomeModel {
  late bool status;
  String? message;
  Data? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Banners>? banners;
  List<Products>? products;
  String? ad;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        banners = <Banners>[];
        banners!.add(Banners.fromJson(element));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((element) {
        products!.add(Products.fromJson(element));
      });
    }
    ad = json['ad'];
  }
}

class Banners {
  late int id;
  late String image;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Products {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late bool inFavorites;
  late bool inCart;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
