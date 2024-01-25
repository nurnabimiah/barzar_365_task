class TransactionDetailsModel {
  String? message;
  TransactionDetailsData? data;
  bool? success;

  TransactionDetailsModel({this.message, this.data, this.success});

  TransactionDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new TransactionDetailsData.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class TransactionDetailsData {
  List<TransactionDetails>? transactionDetails;

  TransactionDetailsData({this.transactionDetails});

  TransactionDetailsData.fromJson(Map<String, dynamic> json) {
    if (json['transaction_details'] != null) {
      transactionDetails = <TransactionDetails>[];
      json['transaction_details'].forEach((v) {
        transactionDetails!.add(new TransactionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactionDetails != null) {
      data['transaction_details'] =
          this.transactionDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionDetails {
  int? id;
  int? takeMoney;
  int? returnTakeMoney;
  int? giveMoney;
  int? receivedGiveMoney;
  String? date;
  int? transactionId;
  String? createdAt;
  String? updatedAt;

  TransactionDetails(
      {this.id,
        this.takeMoney,
        this.returnTakeMoney,
        this.giveMoney,
        this.receivedGiveMoney,
        this.date,
        this.transactionId,
        this.createdAt,
        this.updatedAt});

  TransactionDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    takeMoney = json['take_money'];
    returnTakeMoney = json['return_take_money'];
    giveMoney = json['give_money'];
    receivedGiveMoney = json['received_give_money'];
    date = json['date'];
    transactionId = json['transaction_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['take_money'] = this.takeMoney;
    data['return_take_money'] = this.returnTakeMoney;
    data['give_money'] = this.giveMoney;
    data['received_give_money'] = this.receivedGiveMoney;
    data['date'] = this.date;
    data['transaction_id'] = this.transactionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
