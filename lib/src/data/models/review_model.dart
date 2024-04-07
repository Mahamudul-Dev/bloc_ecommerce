// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
    final String? userId;
    final String? productId;
    final String? review;
    final double? rating;
    final List<Image>? image;

    ReviewModel({
        this.userId,
        this.productId,
        this.review,
        this.rating,
        this.image,
    });

    factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        userId: json["userId"],
        productId: json["productId"],
        review: json["review"],
        rating: json["rating"].toDouble(),
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "productId": productId,
        "review": review,
        "rating": rating,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
    };
}

class Image {
    final String? title;
    final String? url;

    Image({
        this.title,
        this.url,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
    };
}
