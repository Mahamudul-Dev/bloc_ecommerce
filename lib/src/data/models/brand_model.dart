// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
    final String brandName;
    final String brandLogo;

    BrandModel({
        required this.brandName,
        required this.brandLogo,
    });

    factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        brandName: json["brand_name"],
        brandLogo: json["brand_logo"],
    );

    Map<String, dynamic> toJson() => {
        "brand_name": brandName,
        "brand_logo": brandLogo,
    };
}
