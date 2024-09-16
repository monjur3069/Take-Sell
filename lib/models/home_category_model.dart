class HomeCategoryModel {
  HomeCategoryModel({
    required this.data,
    required this.success,
    required this.status,
  });

  final List<Data> data;
  final bool? success;
  final int? status;

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json){
    return HomeCategoryModel(
      data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      success: json["success"],
      status: json["status"],
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.banner,
    required this.icon,
    required this.numberOfChildren,
    required this.links,
  });

  final int? id;
  final String? name;
  final String? banner;
  final String? icon;
  final int? numberOfChildren;
  final Links? links;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      name: json["name"],
      banner: json["banner"],
      icon: json["icon"],
      numberOfChildren: json["number_of_children"],
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );
  }

}

class Links {
  Links({
    required this.products,
    required this.subCategories,
  });

  final String? products;
  final String? subCategories;

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      products: json["products"],
      subCategories: json["sub_categories"],
    );
  }

}
