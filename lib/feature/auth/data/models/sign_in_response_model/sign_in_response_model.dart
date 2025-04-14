import 'package:equatable/equatable.dart';

import 'data.dart';

class SignInResponseModel extends Equatable {
  final Data? data;

  const SignInResponseModel({this.data});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'data': data?.toJson()};

  @override
  List<Object?> get props => [data];
}
