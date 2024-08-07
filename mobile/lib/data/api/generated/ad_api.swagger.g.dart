// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarRecordDto _$CalendarRecordDtoFromJson(Map<String, dynamic> json) =>
    CalendarRecordDto(
      id: json['id'] as int?,
      moodStatus: json['moodStatus'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      noteDescription: json['noteDescription'] as String?,
      pillIds:
          (json['pillIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
    );

Map<String, dynamic> _$CalendarRecordDtoToJson(CalendarRecordDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'moodStatus': instance.moodStatus,
      'date': instance.date?.toIso8601String(),
      'noteDescription': instance.noteDescription,
      'pillIds': instance.pillIds,
    };

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

LoginOTPModel _$LoginOTPModelFromJson(Map<String, dynamic> json) =>
    LoginOTPModel(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$LoginOTPModelToJson(LoginOTPModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };

PillDto _$PillDtoFromJson(Map<String, dynamic> json) => PillDto(
      pillID: json['pill_ID'] as int?,
      pillName: json['pillName'] as String,
      pillDose: json['pillDose'] as String?,
    );

Map<String, dynamic> _$PillDtoToJson(PillDto instance) => <String, dynamic>{
      'pill_ID': instance.pillID,
      'pillName': instance.pillName,
      'pillDose': instance.pillDose,
    };

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) => RegisterUser(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterUserToJson(RegisterUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };

ResetPassword _$ResetPasswordFromJson(Map<String, dynamic> json) =>
    ResetPassword(
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ResetPasswordToJson(ResetPassword instance) =>
    <String, dynamic>{
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'email': instance.email,
      'token': instance.token,
    };

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      id: json['id'] as int?,
      description: json['description'] as String?,
      taskStatus: json['taskStatus'] as int?,
      startDay: json['startDay'] == null
          ? null
          : DateTime.parse(json['startDay'] as String),
      deadlineDay: json['deadlineDay'] == null
          ? null
          : DateTime.parse(json['deadlineDay'] as String),
      pomodoroSessions: json['pomodoroSessions'] as int?,
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'taskStatus': instance.taskStatus,
      'startDay': instance.startDay?.toIso8601String(),
      'deadlineDay': instance.deadlineDay?.toIso8601String(),
      'pomodoroSessions': instance.pomodoroSessions,
    };
