import 'dart:convert';
ApiCallModel apiCallModelFromJson(String str) => ApiCallModel.fromJson(json.decode(str));
String apiCallModelToJson(ApiCallModel data) => json.encode(data.toJson());
class ApiCallModel {
  ApiCallModel({
      this.studentId,
      this.name, 
      this.address, 
      this.fees, 
      this.result,});

  ApiCallModel.fromJson(dynamic json) {
    studentId = json['StudentId'];
    name = json['Name'];
    address = json['Address'];
    fees = json['Fees'] != null ? Fees.fromJson(json['Fees']) : null;
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  int? studentId;
  String? name;
  String? address;
  Fees? fees;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StudentId'] = studentId;
    map['Name'] = name;
    map['Address'] = address;
    if (fees != null) {
      map['Fees'] = fees?.toJson();
    }
    if (result != null) {
      map['Result'] = result?.toJson();
    }
    return map;
  }

}

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      this.hindi, 
      this.eng, 
      this.math, 
      this.total, 
      this.grade,});

  Result.fromJson(dynamic json) {
    hindi = json['Hindi'];
    eng = json['Eng'];
    math = json['Math'];
    total = json['Total'];
    grade = json['Grade'];
  }
  int? hindi;
  int? eng;
  int? math;
  int? total;
  String? grade;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Hindi'] = hindi;
    map['Eng'] = eng;
    map['Math'] = math;
    map['Total'] = total;
    map['Grade'] = grade;
    return map;
  }

}

Fees feesFromJson(String str) => Fees.fromJson(json.decode(str));
String feesToJson(Fees data) => json.encode(data.toJson());
class Fees {
  Fees({
      this.amount, 
      this.paymentDate, 
      this.status,});

  Fees.fromJson(dynamic json) {
    amount = json['Amount'];
    paymentDate = json['PaymentDate'];
    status = json['Status'];
  }
  int? amount;
  String? paymentDate;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = amount;
    map['PaymentDate'] = paymentDate;
    map['Status'] = status;
    return map;
  }

}