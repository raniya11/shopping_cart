class ProductModel{

  final int? id;
  final String? name;
  final int? price;
  final String? imageUrl;
  final int? status;

  ProductModel({this.id,this.name,this.imageUrl,this.price,this.status});

  factory ProductModel.fromJson(Map<String,dynamic>json){
    return ProductModel(id: json['id'],name: json['name'],price: json['price'],imageUrl: json['imageUrl'],status: json['status']);

  }

  toMap(ProductModel product ){
    return{
      'id':product.id,
      'name':product.name,
      'price':product.price,
      'imageUrl':product.imageUrl,
      'status':product.status,
    };
  }
}