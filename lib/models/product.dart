class Product {
  String productId, variantId, name, description, imageUrl, price, location, vendorId;
  List<dynamic> variants, contact;
  int isAvailable, isVariant;

  Product(
      this.productId,
      this.variantId,
      this.name,
      this.description,
      this.imageUrl,
      this.price,
      this.location,
      this.vendorId,
      this.variants,
      this.contact,
      this.isAvailable,
      this.isVariant);

  //TODO: handle variants
  Product.fromJson(var value) {
    this.productId = value['product_id'];
    this.variantId = value['value_id'];
    this.name = value['name'];
    this.description = value['description'];
    this.imageUrl = value['image_url'];
    this.price = value['price'];
    this.location = value['location'];
    this.vendorId = value['vendor_id'];
    this.variants = value[variants];
    this.isAvailable = value['is_available'];
    this.contact = value['contact'];
  }
}
