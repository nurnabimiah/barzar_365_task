




class ProductModel {

  String productId;
  String productName;
  String productPrice;
  bool inStock;
  String productDiscount;
  String productDescription;
  String productImage;
  bool isPlastic;
  String productWeight;
  bool isDiscount;

  ProductModel(
      this.productId,
      this.productName,
      this.productPrice,
      this.inStock,
      this.productDiscount,
      this.productDescription,
      this.productImage,
      this.isPlastic,
      this.productWeight,
      this.isDiscount

      );
}


List<ProductModel>productList=[

   ProductModel('1', "Blog Plastic", '200', true, '300', 'good', 'assets/images/plastic_image.png', true, '1kg',false),
   ProductModel('2', "apple", '700', false, '900', 'good', 'assets/images/apple.png', false, '7kg',true),
   ProductModel('3', "Blog Plastic", '200', true, '300', 'good', 'assets/images/plastic_image.png', true, '1kg',false),
   ProductModel('4', "Blog Plastic", '200', true, '300', 'good', 'assets/images/plastic_image.png', true, '1kg',false),



];