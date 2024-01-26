import 'package:first_flutter_app/utils/extension/enums/sns_type_enum.dart';

class SnsLoginModel {
  String accessToken;
  SNSType snsType;
  String? email;

  SnsLoginModel({
    required this.accessToken,
    required this.snsType,
    this.email,
  });
}
