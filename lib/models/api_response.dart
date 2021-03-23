import 'package:nuborrow/models/bank_detail.dart';
// import 'package:nuborrow/models/messge.dart';
// import 'package:nuborrow/models/rates.dart';
// import 'package:nuborrow/models/user.dart';
import 'package:nuborrow/models/product.dart';

class APIResponse {
  int status;
  String message;
  List<Product> products = [];

  APIResponse(
      {this.status,
      this.message,
      this.products,

      });

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    List<Product> products = [];

    // if (json['data'] != null) {
    //   json['data'].forEach((v) {
    //     products.add(Product.fromJson(v));
    //   });
    // }

    if (json['rates'] != null) {
      json['rates'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }
    //
    // if (json['messages'] != null) {
    //   json['messages'].forEach((v) {
    //     msges.add(Message.fromJson(v));
    //   });
    // }

    return APIResponse(
        status: json['status'],
        message: json['message'],
        // user:
        //     json["status"] == 200 ? User.fromJson(json['user_details']) : null,
        products: products,
        // rates: rates,
        // messages: msges
    );
  }

  @override
  String toString() {
    return 'APIResponse{status: $status, message: $message, products: $products}';
  }
}
