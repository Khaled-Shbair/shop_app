class CategoryModel {
  late bool status;
  late DataCategory dataCategory;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dataCategory = DataCategory.fromJson(json['data']);
  }
}

class DataCategory {
  late int currentPage;

  late List<Data> data = [];

  DataCategory.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      data.add(Data.fromJson(element));
    });
  }
}

class Data {
  late int id;
  late String name;
  late String image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
