class SubCategoryEntity {
  //int? results;
  //Metadata? metadata;
  List<SubDataEntity>? data;

  SubCategoryEntity({this.data});
}


class SubDataEntity {
  String? sId;
  String? name;
  //String? slug;
  //String? category;
  //String? createdAt;
  //String? updatedAt;

  SubDataEntity({this.name,});

}
