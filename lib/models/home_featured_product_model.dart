class HomeFeaturedProductModel {
  HomeFeaturedProductModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.success,
    required this.status,
  });

  final List<Data> data;
  final HomeFeaturedProductModelLinks? links;
  final Meta? meta;
  final bool? success;
  final int? status;

  factory HomeFeaturedProductModel.fromJson(Map<String, dynamic> json){
    return HomeFeaturedProductModel(
      data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      links: json["links"] == null ? null : HomeFeaturedProductModelLinks.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
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
  final DataLinks? links;

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
      links: json["links"] == null ? null : DataLinks.fromJson(json["links"]),
    );
  }

}

class DataLinks {
  DataLinks({
    required this.details,
  });

  final String? details;

  factory DataLinks.fromJson(Map<String, dynamic> json){
    return DataLinks(
      details: json["details"],
    );
  }

}

class HomeFeaturedProductModelLinks {
  HomeFeaturedProductModelLinks({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final dynamic prev;
  final String? next;

  factory HomeFeaturedProductModelLinks.fromJson(Map<String, dynamic> json){
    return HomeFeaturedProductModelLinks(
      first: json["first"],
      last: json["last"],
      prev: json["prev"],
      next: json["next"],
    );
  }

}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link> links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      currentPage: json["current_page"],
      from: json["from"],
      lastPage: json["last_page"],
      links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }

}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json){
    return Link(
      url: json["url"],
      label: json["label"],
      active: json["active"],
    );
  }

}
