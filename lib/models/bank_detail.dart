class BankDetail {
  String bankName;
  double bankRate;
  String term;
  String description;
  String bankLogo;

  BankDetail({this.bankName, this.bankRate, this.term, this.description});

  BankDetail.fromJson(Map<String, dynamic> json) {
    bankName = json['bank_name'];
    bankRate = json['bank_rate'];
    term = json['term'];
    description = json['description'];
    bankLogo = json['bank_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_name'] = this.bankName;
    data['bank_rate'] = this.bankRate;
    data['term'] = this.term;
    data['description'] = this.description;
    data['bank_logo'] = this.bankLogo;

    return data;
  }
}
