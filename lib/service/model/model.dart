import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Email {
  String email;

  Email({
    required this.email,
  });

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);
}
