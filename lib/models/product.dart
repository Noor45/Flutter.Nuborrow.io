import 'package:nuborrow/models/bank_detail.dart';

class Product {
  String id;
  String name;
  List<dynamic> banks;
  // String shortDescription;
  // String icon;
  // String tagline;
  // String rate;
  String description;
  // String status;
  // String terms;

  Product(

      {this.id,
      this.name,
      this.banks,
      // this.shortDescription,
      // this.icon,
      // this.tagline,
      // this.rate,
      this.description,
      // this.status
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banks= json['banks'];
    // shortDescription = json['short_description'];
    // icon = json['icon'];
    // tagline = json['tagline'];
    // rate = json['rate'];
    description = json['description'];
    // status = json['status'];
    // terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    // data['short_description'] = this.shortDescription;
    // data['icon'] = this.icon;
    // data['tagline'] = this.tagline;
    // data['rate'] = this.rate;
    data['description'] = this.description;
    // data['status'] = this.status;
    // data['terms'] = this.terms;
    return data;
  }
}
