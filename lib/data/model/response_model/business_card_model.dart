class BusinessCardDataModel {
  String? message;
  BusinessCardData? data;
  bool? success;

  BusinessCardDataModel({this.message, this.data, this.success});

  BusinessCardDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new BusinessCardData.fromJson(json['data']) : null;
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

class BusinessCardData {
  BusinessCard? businessCard;

  BusinessCardData({this.businessCard});

  BusinessCardData.fromJson(Map<String, dynamic> json) {
    businessCard = json['business_card'] != null
        ? new BusinessCard.fromJson(json['business_card'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.businessCard != null) {
      data['business_card'] = this.businessCard!.toJson();
    }
    return data;
  }
}

class BusinessCard {
  int? id;
  String? businessName;
  String? phoneNumber;
  String? email;
  String? businessAddress;
  int? userId;
  String? createdAt;
  String? updatedAt;

  BusinessCard(
      {this.id,
        this.businessName,
        this.phoneNumber,
        this.email,
        this.businessAddress,
        this.userId,
        this.createdAt,
        this.updatedAt});

  BusinessCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessName = json['business_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    businessAddress = json['business_address'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_name'] = this.businessName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['business_address'] = this.businessAddress;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
