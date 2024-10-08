import 'package:json_annotation/json_annotation.dart';
part 'specializations_response_model.g.dart';
@JsonSerializable()
class SpecializationsResponseModel {
  String? message;
  @JsonKey(name: 'data')
  List<SpecializationData>? specializationData;
  bool? status;
  int? code;

  SpecializationsResponseModel({this.message, this.specializationData, this.status, this.code});

 factory SpecializationsResponseModel.fromJson(Map<
 String ,dynamic> json)=>_$SpecializationsResponseModelFromJson(json);
}
@JsonSerializable()
class SpecializationData {
  int? id;
  String? name;
   @JsonKey(name: 'doctors')
  List<Doctors>? doctorsList;

  SpecializationData({this.id, this.name, this.doctorsList});

 factory SpecializationData.fromJson(Map<
 String ,dynamic> json)=>_$SpecializationDataFromJson(json);
}
@JsonSerializable()
class Doctors {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  int? appointPrice;
  String? startTime;
  String? endTime;

  Doctors(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.photo,
      this.gender,
      this.address,
      this.description,
      this.degree,
    
      this.appointPrice,
      this.startTime,
      this.endTime});

   factory Doctors.fromJson(Map<
 String ,dynamic> json)=>_$DoctorsFromJson(json);
}




