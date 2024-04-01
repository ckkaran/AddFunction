// To parse this JSON data, do
//
//     final productlistmodel = productlistmodelFromJson(jsonString);

import 'dart:convert';

Productlistmodel productlistmodelFromJson(String str) => Productlistmodel.fromJson(json.decode(str));

String productlistmodelToJson(Productlistmodel data) => json.encode(data.toJson());

class Productlistmodel {
    int? status;
    String? message;
    int? dataCount;
    List<Datum>? data;

    Productlistmodel({
        this.status,
        this.message,
        this.dataCount,
        this.data,
    });

    factory Productlistmodel.fromJson(Map<String, dynamic> json) => Productlistmodel(
        status: json["status"],
        message: json["message"],
        dataCount: json["data_count"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data_count": dataCount,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? productId;
    String? productName;
    int? categoryId;
    int? subCategoryId;
    int? brandId;
    String? productDescription;
    String? productImage;
    int? productStockQuantity;
    int? dealerId;
    int? isActive;
    DateTime? lastActiveDate;
    int? createdBy;
    DateTime? createdTs;
    int? updatedBy;
    DateTime? updatedTs;
    int? productPriceId;
    int? productPrice;
    int? productDiscount;
    int? productSellingPrice;
    int? deliveryCharge;
    int? codCharge;
    int? isExchangeable;
    int? exchangeableQtyAmt;
    String? prodImage;

    Datum({
        this.productId,
        this.productName,
        this.categoryId,
        this.subCategoryId,
        this.brandId,
        this.productDescription,
        this.productImage,
        this.productStockQuantity,
        this.dealerId,
        this.isActive,
        this.lastActiveDate,
        this.createdBy,
        this.createdTs,
        this.updatedBy,
        this.updatedTs,
        this.productPriceId,
        this.productPrice,
        this.productDiscount,
        this.productSellingPrice,
        this.deliveryCharge,
        this.codCharge,
        this.isExchangeable,
        this.exchangeableQtyAmt,
        this.prodImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        productName: json["product_name"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        brandId: json["brand_id"],
        productDescription: json["product_description"],
        productImage: json["product_image"],
        productStockQuantity: json["product_stock_quantity"],
        dealerId: json["dealer_id"],
        isActive: json["is_active"],
        lastActiveDate: json["last_active_date"] == null ? null : DateTime.parse(json["last_active_date"]),
        createdBy: json["created_by"],
        createdTs: json["created_ts"] == null ? null : DateTime.parse(json["created_ts"]),
        updatedBy: json["updated_by"],
        updatedTs: json["updated_ts"] == null ? null : DateTime.parse(json["updated_ts"]),
        productPriceId: json["product_price_id"],
        productPrice: json["product_price"],
        productDiscount: json["product_discount"],
        productSellingPrice: json["product_selling_price"],
        deliveryCharge: json["delivery_charge"],
        codCharge: json["cod_charge"],
        isExchangeable: json["is_exchangeable"],
        exchangeableQtyAmt: json["exchangeable_qty_amt"],
        prodImage: json["prod_image"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "brand_id": brandId,
        "product_description": productDescription,
        "product_image": productImage,
        "product_stock_quantity": productStockQuantity,
        "dealer_id": dealerId,
        "is_active": isActive,
        "last_active_date": "${lastActiveDate!.year.toString().padLeft(4, '0')}-${lastActiveDate!.month.toString().padLeft(2, '0')}-${lastActiveDate!.day.toString().padLeft(2, '0')}",
        "created_by": createdBy,
        "created_ts": createdTs?.toIso8601String(),
        "updated_by": updatedBy,
        "updated_ts": updatedTs?.toIso8601String(),
        "product_price_id": productPriceId,
        "product_price": productPrice,
        "product_discount": productDiscount,
        "product_selling_price": productSellingPrice,
        "delivery_charge": deliveryCharge,
        "cod_charge": codCharge,
        "is_exchangeable": isExchangeable,
        "exchangeable_qty_amt": exchangeableQtyAmt,
        "prod_image": prodImage,
    };
}
