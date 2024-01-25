class TransactionInfoModel {
  String? message;
  TransactionData? data;
  bool? success;

  TransactionInfoModel({this.message, this.data, this.success});

  TransactionInfoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new TransactionData.fromJson(json['data']) : null;
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

class TransactionData {
  List<TransactionInformations>? transactionInformations;
  TotalMoney? totalMoney;

  TransactionData({this.transactionInformations, this.totalMoney});

  TransactionData.fromJson(Map<String, dynamic> json) {
    if (json['transaction_informations'] != null) {
      transactionInformations = <TransactionInformations>[];
      json['transaction_informations'].forEach((v) {
        transactionInformations!.add(new TransactionInformations.fromJson(v));
      });
    }
    totalMoney = json['total_money'] != null
        ? new TotalMoney.fromJson(json['total_money'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactionInformations != null) {
      data['transaction_informations'] =
          this.transactionInformations!.map((v) => v.toJson()).toList();
    }
    if (this.totalMoney != null) {
      data['total_money'] = this.totalMoney!.toJson();
    }
    return data;
  }
}

class TransactionInformations {
  int? id;
  String? customerName;
  int? takeMoney;
  int? returnTakeMoney;
  int? giveMoney;
  int? receivedGiveMoney;
  String? phoneNumber;
  String? note;
  String? date;
  int? userId;
  String? createdAt;
  String? updatedAt;

  TransactionInformations(
      {this.id,
        this.customerName,
        this.takeMoney,
        this.returnTakeMoney,
        this.giveMoney,
        this.receivedGiveMoney,
        this.phoneNumber,
        this.note,
        this.date,
        this.userId,
        this.createdAt,
        this.updatedAt});

  TransactionInformations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    takeMoney = json['take_money'];
    returnTakeMoney = json['return_take_money'];
    giveMoney = json['give_money'];
    receivedGiveMoney = json['received_give_money'];
    phoneNumber = json['phone_number'];
    note = json['note'];
    date = json['date'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_name'] = this.customerName;
    data['take_money'] = this.takeMoney;
    data['return_take_money'] = this.returnTakeMoney;
    data['give_money'] = this.giveMoney;
    data['received_give_money'] = this.receivedGiveMoney;
    data['phone_number'] = this.phoneNumber;
    data['note'] = this.note;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TotalMoney {
  int? totalTakeMoney;
  int? totalGiveMoney;

  TotalMoney({this.totalTakeMoney, this.totalGiveMoney});

  TotalMoney.fromJson(Map<String, dynamic> json) {
    totalTakeMoney = json['total_take_money'];
    totalGiveMoney = json['total_give_money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_take_money'] = this.totalTakeMoney;
    data['total_give_money'] = this.totalGiveMoney;
    return data;
  }
}
