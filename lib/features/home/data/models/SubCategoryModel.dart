import 'package:e_commerce_app/features/home/domain/entities/SubCategoryEntity.dart';

class SubCategoryModel extends SubCategoryEntity{
  int? results;
  MetadataModel? metadata;

  SubCategoryModel({this.results, this.metadata, List<DataModel>? data});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? MetadataModel.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(DataModel.fromJson(v));
      });
    }
  }
}

class MetadataModel {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataModel({this.currentPage, this.numberOfPages, this.limit});

  MetadataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}

class DataModel extends SubDataEntity {
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;

  DataModel(
      {String? sId,
        String? name,
        this.slug,
        this.category,
        this.createdAt,
        this.updatedAt});

  DataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
