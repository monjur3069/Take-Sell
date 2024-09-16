class HomeTodaysDealModel {
  HomeTodaysDealModel({
    required this.data,
    required this.success,
    required this.status,
  });

  final List<Data> data;
  final bool? success;
  final int? status;

  factory HomeTodaysDealModel.fromJson(Map<String, dynamic> json){
    return HomeTodaysDealModel(
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
    required this.thumbnailImage,
    required this.hasDiscount,
    required this.strokedPrice,
    required this.mainPrice,
    required this.rating,
    required this.sales,
    required this.links,
  });

  final int? id;
  final String? name;
  final String? thumbnailImage;
  final bool? hasDiscount;
  final String? strokedPrice;
  final String? mainPrice;
  final int? rating;
  final int? sales;
  final Links? links;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      name: json["name"],
      thumbnailImage: json["thumbnail_image"],
      hasDiscount: json["has_discount"],
      strokedPrice: json["stroked_price"],
      mainPrice: json["main_price"],
      rating: json["rating"],
      sales: json["sales"],
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );
  }

}

class Links {
  Links({
    required this.details,
  });

  final String? details;

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      details: json["details"],
    );
  }

}
