class ProductEntity {
  ProductEntity({
      this.results, 
      this.metadata, 
      this.data,});

  num? results;
  MetadataEntity? metadata;
  List<ProductDataEntity>? data;



}

class ProductDataEntity {
  ProductDataEntity({
    this.title,
    this.price,
      this.priceAfterDiscount, 
      this.imageCover,
      this.ratingsAverage,
  });


  String? title;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  num? ratingsAverage;


}

class MetadataEntity {
  MetadataEntity({
      this.currentPage,
      this.numberOfPages,
      this.limit,});


  num? currentPage;
  num? numberOfPages;
  num? limit;



}