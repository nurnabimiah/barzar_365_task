



// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

List<ProductListModel> productListFromJson(String str) => List<ProductListModel>.from(json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListToJson(List<ProductListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
  String id;
  Employee employee;
  Brand? brand;
  Category category;
  Subcategory subcategory;
  String name;
  int sku;
  int price;
  String shortDescription;
  String description;
  int quantity;
  bool isVisible;
  bool isPlastic;
  String image;
  bool isDiscount;
  bool isBogo;
  double discountedAmount;
  int precedence;
  String productWeight;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Brand? plasticType;
  int? weight;
  String? discountType;
  int? discountAmount;

  ProductListModel({
    required this.id,
    required this.employee,
    this.brand,
    required this.category,
    required this.subcategory,
    required this.name,
    required this.sku,
    required this.price,
    required this.shortDescription,
    required this.description,
    required this.quantity,
    required this.isVisible,
    required this.isPlastic,
    required this.image,
    required this.isDiscount,
    required this.isBogo,
    required this.discountedAmount,
    required this.precedence,
    required this.productWeight,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.plasticType,
    this.weight,
    this.discountType,
    this.discountAmount,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    id: json["_id"],
    employee: Employee.fromJson(json["employee"]),
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
    category: Category.fromJson(json["category"]),
    subcategory: Subcategory.fromJson(json["subcategory"]),
    name: json["name"],
    sku: json["sku"],
    price: json["price"],
    shortDescription: json["shortDescription"],
    description: json["description"],
    quantity: json["quantity"],
    isVisible: json["isVisible"],
    isPlastic: json["isPlastic"],
    image: json["image"],
    isDiscount: json["isDiscount"],
    isBogo: json["isBogo"],
    discountedAmount: json["discountedAmount"]?.toDouble(),
    precedence: json["precedence"],
    productWeight: json["productWeight"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    plasticType: json["plasticType"] == null ? null : Brand.fromJson(json["plasticType"]),
    weight: json["weight"],
    discountType: json["discountType"],
    discountAmount: json["discountAmount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "employee": employee.toJson(),
    "brand": brand?.toJson(),
    "category": category.toJson(),
    "subcategory": subcategory.toJson(),
    "name": name,
    "sku": sku,
    "price": price,
    "shortDescription": shortDescription,
    "description": description,
    "quantity": quantity,
    "isVisible": isVisible,
    "isPlastic": isPlastic,
    "image": image,
    "isDiscount": isDiscount,
    "isBogo": isBogo,
    "discountedAmount": discountedAmount,
    "precedence": precedence,
    "productWeight": productWeight,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "plasticType": plasticType?.toJson(),
    "weight": weight,
    "discountType": discountType,
    "discountAmount": discountAmount,
  };
}






class Brand {
  String id;
  String name;
  String? image;
  int v;
  int? point;

  Brand({
    required this.id,
    required this.name,
    this.image,
    required this.v,
    this.point,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    v: json["__v"],
    point: json["point"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "__v": v,
    "point": point,
  };
}

class Category {
  Id id;
  CategoryName name;
  int precedence;
  CategoryImage image;
  bool isActive;
  bool isDiscount;
  int v;

  Category({
    required this.id,
    required this.name,
    required this.precedence,
    required this.image,
    required this.isActive,
    required this.isDiscount,
    required this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: idValues.map[json["_id"]]!,
    name: categoryNameValues.map[json["name"]]!,
    precedence: json["precedence"],
    image: categoryImageValues.map[json["image"]]!,
    isActive: json["isActive"],
    isDiscount: json["isDiscount"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": idValues.reverse[id],
    "name": categoryNameValues.reverse[name],
    "precedence": precedence,
    "image": categoryImageValues.reverse[image],
    "isActive": isActive,
    "isDiscount": isDiscount,
    "__v": v,
  };
}

enum Id {
  THE_65_A3_C9231175_E4945_EC2_C0_B1,
  THE_65_A3_C9623898_FEA6001_B179_D,
  THE_65_A3_CA153898_FEA6001_B17_F3
}

final idValues = EnumValues({
  "65a3c9231175e4945ec2c0b1": Id.THE_65_A3_C9231175_E4945_EC2_C0_B1,
  "65a3c9623898fea6001b179d": Id.THE_65_A3_C9623898_FEA6001_B179_D,
  "65a3ca153898fea6001b17f3": Id.THE_65_A3_CA153898_FEA6001_B17_F3
});

enum CategoryImage {
  CATEGORY_IMAGES_17059969211757_PNG,
  CATEGORY_IMAGES_17059969661654_PNG,
  CATEGORY_IMAGES_17059969812523_PNG
}

final categoryImageValues = EnumValues({
  "categoryImages/1705996921175-7.png": CategoryImage.CATEGORY_IMAGES_17059969211757_PNG,
  "categoryImages/1705996966165-4.png": CategoryImage.CATEGORY_IMAGES_17059969661654_PNG,
  "categoryImages/1705996981252-3.png": CategoryImage.CATEGORY_IMAGES_17059969812523_PNG
});

enum CategoryName {
  GROCERY,
  PET_CARE,
  STATIONERY_OFFICE
}

final categoryNameValues = EnumValues({
  "Grocery": CategoryName.GROCERY,
  "Pet Care ": CategoryName.PET_CARE,
  "Stationery & Office": CategoryName.STATIONERY_OFFICE
});

class Employee {
  EmployeeId id;
  EmployeeName name;
  Email email;
  Password password;
  Level level;
  EmployeeImage image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.level,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: employeeIdValues.map[json["_id"]]!,
    name: employeeNameValues.map[json["name"]]!,
    email: emailValues.map[json["email"]]!,
    password: passwordValues.map[json["password"]]!,
    level: levelValues.map[json["level"]]!,
    image: employeeImageValues.map[json["image"]]!,
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": employeeIdValues.reverse[id],
    "name": employeeNameValues.reverse[name],
    "email": emailValues.reverse[email],
    "password": passwordValues.reverse[password],
    "level": levelValues.reverse[level],
    "image": employeeImageValues.reverse[image],
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}



  enum Email {
  AZIZ_MIYAZI_BAZAR365_BIZ
}

  final emailValues = EnumValues({
  "aziz.miyazi@bazar365.biz": Email.AZIZ_MIYAZI_BAZAR365_BIZ
});

  enum EmployeeId {
  THE_65_A388_BC77_A116_ACD1070_FD9
}

  final employeeIdValues = EnumValues({
  "65a388bc77a116acd1070fd9": EmployeeId.THE_65_A388_BC77_A116_ACD1070_FD9
});

  enum EmployeeImage {
  EMPLOYEES_IMAGES_1705216187942_AZIZ_JPG
}

  final employeeImageValues = EnumValues({
  "employees/images/1705216187942-aziz.jpg": EmployeeImage.EMPLOYEES_IMAGES_1705216187942_AZIZ_JPG
});

  enum Level {
  ADMIN
}

  final levelValues = EnumValues({
  "admin": Level.ADMIN
});

  enum EmployeeName {
  AZIZ
}

  final employeeNameValues = EnumValues({
  "aziz": EmployeeName.AZIZ
});

  enum Password {
  THE_2_A_10_E_DJ9_JL7_QB9_W_K_CSD0_HJAL_TVJ_SDR2_D_VQ_ASLU_HQAM_AD_R_LO8_IHT_A_I
  }

  final passwordValues = EnumValues({
  "\u00242a\u002410\u0024eDJ9JL7QB9W/KCsd0Hjal.TVJ.SDR2dVqASLUHqamAdRLo8IhtA.i": Password.THE_2_A_10_E_DJ9_JL7_QB9_W_K_CSD0_HJAL_TVJ_SDR2_D_VQ_ASLU_HQAM_AD_R_LO8_IHT_A_I
   });

  class Subcategory {
  String id;
  Id category;
  String name;
  int precedence;
  bool isActive;
  int v;

  Subcategory({
    required this.id,
    required this.category,
    required this.name,
    required this.precedence,
    required this.isActive,
    required this.v,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["_id"],
    category: idValues.map[json["category"]]!,
    name: json["name"],
    precedence: json["precedence"],
    isActive: json["isActive"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": idValues.reverse[category],
    "name": name,
    "precedence": precedence,
    "isActive": isActive,
    "__v": v,
  };
}

   class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}







