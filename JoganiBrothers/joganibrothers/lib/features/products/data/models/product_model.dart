import 'dart:convert';
/// product : [{"brandname":1,"weight":"steve","price":"captainamerica","transportation":"captainamerica","cgst":"captainamerica","sgst":"captainamerica"}]

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
      this.product,});

  ProductModel.fromJson(dynamic json) {
    if (json['product'] != null) {
      product = [];
      json['product'].forEach((v) {
        product?.add(Product.fromJson(v));
      });
    }
  }
  List<Product>? product;
ProductModel copyWith({  List<Product>? product,
}) => ProductModel(  product: product ?? this.product,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// brandname : 1
/// weight : "steve"
/// price : "captainamerica"
/// transportation : "captainamerica"
/// cgst : "captainamerica"
/// sgst : "captainamerica"

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      this.brandname, 
      this.weight, 
      this.price, 
      this.transportation, 
      this.cgst, 
      this.sgst,});

  Product.fromJson(dynamic json) {
    brandname = json['brandname'];
    weight = json['weight'];
    price = json['price'];
    transportation = json['transportation'];
    cgst = json['cgst'];
    sgst = json['sgst'];
  }
  int? brandname;
  String? weight;
  String? price;
  String? transportation;
  String? cgst;
  String? sgst;
Product copyWith({  int? brandname,
  String? weight,
  String? price,
  String? transportation,
  String? cgst,
  String? sgst,
}) => Product(  brandname: brandname ?? this.brandname,
  weight: weight ?? this.weight,
  price: price ?? this.price,
  transportation: transportation ?? this.transportation,
  cgst: cgst ?? this.cgst,
  sgst: sgst ?? this.sgst,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brandname'] = brandname;
    map['weight'] = weight;
    map['price'] = price;
    map['transportation'] = transportation;
    map['cgst'] = cgst;
    map['sgst'] = sgst;
    return map;
  }

}