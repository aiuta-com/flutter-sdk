import 'package:aiuta_flutter/src/models/actions/aiuta_auth_action_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aiuta_auth_action.g.dart';

sealed class AiutaAuthAction {
  AiutaAuthActionType type;

  AiutaAuthAction(this.type);

  // Json staff
  factory AiutaAuthAction.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'requestJWT':
        return RequestJWTAction.fromJson(json);
      default:
        throw Exception('Unknown auth action type');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class RequestJWTAction extends AiutaAuthAction {
  final String params;

  RequestJWTAction({
    required this.params,
  }) : super(AiutaAuthActionType.requestJWT);

  // Json staff
  factory RequestJWTAction.fromJson(Map<String, dynamic> json) =>
      _$RequestJWTActionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RequestJWTActionToJson(this);
}
