class HomeModel {
  late bool status;
  late Data data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
    //  data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  late List<Banners> banners = [];
  late List<Products> products = [];
  late String ad;

  Data.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(Banners.fromJson(element));
    });
    json['products'].forEach((element) {
      products.add(Products.fromJson(element));
    });
    ad = json['ad'];
  }
}

class Banners {
  late int id;
  late String image;
 // Null category;
  //Null product;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    //category = json['category'];
    //product = json['product'];
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
  //late String description;
  //late List<String> images;
  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
   // description = json['description'];
   // images = json['images'].cast<String>();
  }
}
