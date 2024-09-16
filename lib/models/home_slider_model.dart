class HomeSliderModel {
  HomeSliderModel({
    required this.data,
    required this.success,
    required this.status,
  });

  final List<Data> data;
  final bool? success;
  final int? status;

  factory HomeSliderModel.fromJson(Map<String, dynamic> json){
    return HomeSliderModel(
      data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      success: json["success"],
      status: json["status"],
    );
  }

}

class Data {
  Data({
    required this.photo,
  });

  final String? photo;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      photo: json["photo"],
    );
  }

}
