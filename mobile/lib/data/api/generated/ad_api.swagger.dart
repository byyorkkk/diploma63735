// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;

part 'ad_api.swagger.chopper.dart';
part 'ad_api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class AdApi extends ChopperService {
  static AdApi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$AdApi(client);
    }

    final newClient = ChopperClient(
        services: [_$AdApi()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$AdApi(newClient);
  }

  ///
  Future<chopper.Response> apiAuthenticationPost(
      {required RegisterUser? body}) {
    return _apiAuthenticationPost(body: body);
  }

  ///
  @Post(
    path: '/api/Authentication',
    optionalBody: true,
  )
  Future<chopper.Response> _apiAuthenticationPost(
      {@Body() required RegisterUser? body});

  ///
  ///@param token
  ///@param email
  Future<chopper.Response> apiAuthenticationConfirmEmailGet({
    String? token,
    String? email,
  }) {
    return _apiAuthenticationConfirmEmailGet(token: token, email: email);
  }

  ///
  ///@param token
  ///@param email
  @Get(path: '/api/Authentication/ConfirmEmail')
  Future<chopper.Response> _apiAuthenticationConfirmEmailGet({
    @Query('token') String? token,
    @Query('email') String? email,
  });

  ///
  Future<chopper.Response> apiAuthenticationLogInPost(
      {required LoginModel? body}) {
    return _apiAuthenticationLogInPost(body: body);
  }

  ///
  @Post(
    path: '/api/Authentication/LogIn',
    optionalBody: true,
  )
  Future<chopper.Response> _apiAuthenticationLogInPost(
      {@Body() required LoginModel? body});

  ///
  Future<chopper.Response> apiAuthenticationLogIn2FAPost(
      {required LoginOTPModel? body}) {
    return _apiAuthenticationLogIn2FAPost(body: body);
  }

  ///
  @Post(
    path: '/api/Authentication/LogIn-2FA',
    optionalBody: true,
  )
  Future<chopper.Response> _apiAuthenticationLogIn2FAPost(
      {@Body() required LoginOTPModel? body});

  ///
  ///@param email
  Future<chopper.Response> apiAuthenticationForgotPasswordPost(
      {required String? email}) {
    return _apiAuthenticationForgotPasswordPost(email: email);
  }

  ///
  ///@param email
  @Post(
    path: '/api/Authentication/ForgotPassword',
    optionalBody: true,
  )
  Future<chopper.Response> _apiAuthenticationForgotPasswordPost(
      {@Query('email') required String? email});

  ///
  ///@param token
  ///@param email
  Future<chopper.Response> apiAuthenticationResetPasswordGet({
    String? token,
    String? email,
  }) {
    return _apiAuthenticationResetPasswordGet(token: token, email: email);
  }

  ///
  ///@param token
  ///@param email
  @Get(path: '/api/Authentication/ResetPassword')
  Future<chopper.Response> _apiAuthenticationResetPasswordGet({
    @Query('token') String? token,
    @Query('email') String? email,
  });

  ///
  Future<chopper.Response> apiAuthenticationResetPasswordPost(
      {required ResetPassword? body}) {
    return _apiAuthenticationResetPasswordPost(body: body);
  }

  ///
  @Post(
    path: '/api/Authentication/ResetPassword',
    optionalBody: true,
  )
  Future<chopper.Response> _apiAuthenticationResetPasswordPost(
      {@Body() required ResetPassword? body});

  ///
  ///@param email
  Future<chopper.Response> apiAuthenticationDeleteUserDelete(
      {required String? email}) {
    return _apiAuthenticationDeleteUserDelete(email: email);
  }

  ///
  ///@param email
  @Delete(path: '/api/Authentication/DeleteUser')
  Future<chopper.Response> _apiAuthenticationDeleteUserDelete(
      {@Query('email') required String? email});

  ///
  Future<chopper.Response> apiCalendarRecordGetRecordsGet() {
    return _apiCalendarRecordGetRecordsGet();
  }

  ///
  @Get(path: '/api/calendarRecord/getRecords')
  Future<chopper.Response> _apiCalendarRecordGetRecordsGet();

  ///
  ///@param id
  Future<chopper.Response> apiCalendarRecordGetRecordIdGet({required int? id}) {
    return _apiCalendarRecordGetRecordIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/calendarRecord/getRecord/{id}')
  Future<chopper.Response> _apiCalendarRecordGetRecordIdGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response> apiCalendarRecordCreateRecordPost(
      {required CalendarRecordDto? body}) {
    return _apiCalendarRecordCreateRecordPost(body: body);
  }

  ///
  @Post(
    path: '/api/calendarRecord/createRecord',
    optionalBody: true,
  )
  Future<chopper.Response> _apiCalendarRecordCreateRecordPost(
      {@Body() required CalendarRecordDto? body});

  ///
  ///@param id
  Future<chopper.Response> apiCalendarRecordEditRecordIdPut({
    required int? id,
    required CalendarRecordDto? body,
  }) {
    return _apiCalendarRecordEditRecordIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/api/calendarRecord/editRecord/{id}',
    optionalBody: true,
  )
  Future<chopper.Response> _apiCalendarRecordEditRecordIdPut({
    @Path('id') required int? id,
    @Body() required CalendarRecordDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> apiCalendarRecordDeleteIdDelete({required int? id}) {
    return _apiCalendarRecordDeleteIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/calendarRecord/delete/{id}')
  Future<chopper.Response> _apiCalendarRecordDeleteIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response> apiPillsGet() {
    return _apiPillsGet();
  }

  ///
  @Get(path: '/api/pills')
  Future<chopper.Response> _apiPillsGet();

  ///
  ///@param id
  Future<chopper.Response> apiPillsIdGet({required int? id}) {
    return _apiPillsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/pills/{id}')
  Future<chopper.Response> _apiPillsIdGet({@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response> apiPillsIdDelete({required int? id}) {
    return _apiPillsIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/pills/{id}')
  Future<chopper.Response> _apiPillsIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response> apiPillsNewPost({required PillDto? body}) {
    return _apiPillsNewPost(body: body);
  }

  ///
  @Post(
    path: '/api/pills/new',
    optionalBody: true,
  )
  Future<chopper.Response> _apiPillsNewPost({@Body() required PillDto? body});

  ///
  ///@param id
  Future<chopper.Response> apiPillsEditIdPut({
    required int? id,
    required PillDto? body,
  }) {
    return _apiPillsEditIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/api/pills/edit/{id}',
    optionalBody: true,
  )
  Future<chopper.Response> _apiPillsEditIdPut({
    @Path('id') required int? id,
    @Body() required PillDto? body,
  });

  ///
  Future<chopper.Response> apiTasksGet() {
    return _apiTasksGet();
  }

  ///
  @Get(path: '/api/tasks')
  Future<chopper.Response> _apiTasksGet();

  ///
  ///@param id
  Future<chopper.Response> apiTasksIdGet({required int? id}) {
    return _apiTasksIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/tasks/{id}')
  Future<chopper.Response> _apiTasksIdGet({@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response> apiTasksIdDelete({required int? id}) {
    return _apiTasksIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/tasks/{id}')
  Future<chopper.Response> _apiTasksIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response> apiTasksNewPost({required TaskDto? body}) {
    return _apiTasksNewPost(body: body);
  }

  ///
  @Post(
    path: '/api/tasks/new',
    optionalBody: true,
  )
  Future<chopper.Response> _apiTasksNewPost({@Body() required TaskDto? body});

  ///
  ///@param id
  Future<chopper.Response> apiTasksEditIdPut({
    required int? id,
    required TaskDto? body,
  }) {
    return _apiTasksEditIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/api/tasks/edit/{id}',
    optionalBody: true,
  )
  Future<chopper.Response> _apiTasksEditIdPut({
    @Path('id') required int? id,
    @Body() required TaskDto? body,
  });
}

@JsonSerializable(explicitToJson: true)
class CalendarRecordDto {
  const CalendarRecordDto({
    this.id,
    this.moodStatus,
    this.date,
    this.noteDescription,
    this.pillIds,
  });

  factory CalendarRecordDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarRecordDtoFromJson(json);

  static const toJsonFactory = _$CalendarRecordDtoToJson;
  Map<String, dynamic> toJson() => _$CalendarRecordDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'moodStatus')
  final int? moodStatus;
  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'noteDescription')
  final String? noteDescription;
  @JsonKey(name: 'pillIds', defaultValue: <int>[])
  final List<int>? pillIds;
  static const fromJsonFactory = _$CalendarRecordDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CalendarRecordDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.moodStatus, moodStatus) ||
                const DeepCollectionEquality()
                    .equals(other.moodStatus, moodStatus)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.noteDescription, noteDescription) ||
                const DeepCollectionEquality()
                    .equals(other.noteDescription, noteDescription)) &&
            (identical(other.pillIds, pillIds) ||
                const DeepCollectionEquality().equals(other.pillIds, pillIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(moodStatus) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(noteDescription) ^
      const DeepCollectionEquality().hash(pillIds) ^
      runtimeType.hashCode;
}

extension $CalendarRecordDtoExtension on CalendarRecordDto {
  CalendarRecordDto copyWith(
      {int? id,
      int? moodStatus,
      DateTime? date,
      String? noteDescription,
      List<int>? pillIds}) {
    return CalendarRecordDto(
        id: id ?? this.id,
        moodStatus: moodStatus ?? this.moodStatus,
        date: date ?? this.date,
        noteDescription: noteDescription ?? this.noteDescription,
        pillIds: pillIds ?? this.pillIds);
  }

  CalendarRecordDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? moodStatus,
      Wrapped<DateTime?>? date,
      Wrapped<String?>? noteDescription,
      Wrapped<List<int>?>? pillIds}) {
    return CalendarRecordDto(
        id: (id != null ? id.value : this.id),
        moodStatus: (moodStatus != null ? moodStatus.value : this.moodStatus),
        date: (date != null ? date.value : this.date),
        noteDescription: (noteDescription != null
            ? noteDescription.value
            : this.noteDescription),
        pillIds: (pillIds != null ? pillIds.value : this.pillIds));
  }
}

@JsonSerializable(explicitToJson: true)
class LoginModel {
  const LoginModel({
    required this.email,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  static const toJsonFactory = _$LoginModelToJson;
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  static const fromJsonFactory = _$LoginModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LoginModel &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginModelExtension on LoginModel {
  LoginModel copyWith({String? email, String? password}) {
    return LoginModel(
        email: email ?? this.email, password: password ?? this.password);
  }

  LoginModel copyWithWrapped(
      {Wrapped<String>? email, Wrapped<String>? password}) {
    return LoginModel(
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class LoginOTPModel {
  const LoginOTPModel({
    required this.email,
    required this.code,
  });

  factory LoginOTPModel.fromJson(Map<String, dynamic> json) =>
      _$LoginOTPModelFromJson(json);

  static const toJsonFactory = _$LoginOTPModelToJson;
  Map<String, dynamic> toJson() => _$LoginOTPModelToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'code')
  final String code;
  static const fromJsonFactory = _$LoginOTPModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LoginOTPModel &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(code) ^
      runtimeType.hashCode;
}

extension $LoginOTPModelExtension on LoginOTPModel {
  LoginOTPModel copyWith({String? email, String? code}) {
    return LoginOTPModel(email: email ?? this.email, code: code ?? this.code);
  }

  LoginOTPModel copyWithWrapped(
      {Wrapped<String>? email, Wrapped<String>? code}) {
    return LoginOTPModel(
        email: (email != null ? email.value : this.email),
        code: (code != null ? code.value : this.code));
  }
}

@JsonSerializable(explicitToJson: true)
class PillDto {
  const PillDto({
    this.pillID,
    required this.pillName,
    this.pillDose,
  });

  factory PillDto.fromJson(Map<String, dynamic> json) =>
      _$PillDtoFromJson(json);

  static const toJsonFactory = _$PillDtoToJson;
  Map<String, dynamic> toJson() => _$PillDtoToJson(this);

  @JsonKey(name: 'pill_ID')
  final int? pillID;
  @JsonKey(name: 'pillName')
  final String pillName;
  @JsonKey(name: 'pillDose')
  final String? pillDose;
  static const fromJsonFactory = _$PillDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PillDto &&
            (identical(other.pillID, pillID) ||
                const DeepCollectionEquality().equals(other.pillID, pillID)) &&
            (identical(other.pillName, pillName) ||
                const DeepCollectionEquality()
                    .equals(other.pillName, pillName)) &&
            (identical(other.pillDose, pillDose) ||
                const DeepCollectionEquality()
                    .equals(other.pillDose, pillDose)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(pillID) ^
      const DeepCollectionEquality().hash(pillName) ^
      const DeepCollectionEquality().hash(pillDose) ^
      runtimeType.hashCode;
}

extension $PillDtoExtension on PillDto {
  PillDto copyWith({int? pillID, String? pillName, String? pillDose}) {
    return PillDto(
        pillID: pillID ?? this.pillID,
        pillName: pillName ?? this.pillName,
        pillDose: pillDose ?? this.pillDose);
  }

  PillDto copyWithWrapped(
      {Wrapped<int?>? pillID,
      Wrapped<String>? pillName,
      Wrapped<String?>? pillDose}) {
    return PillDto(
        pillID: (pillID != null ? pillID.value : this.pillID),
        pillName: (pillName != null ? pillName.value : this.pillName),
        pillDose: (pillDose != null ? pillDose.value : this.pillDose));
  }
}

@JsonSerializable(explicitToJson: true)
class RegisterUser {
  const RegisterUser({
    required this.username,
    required this.email,
    required this.password,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);

  static const toJsonFactory = _$RegisterUserToJson;
  Map<String, dynamic> toJson() => _$RegisterUserToJson(this);

  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  static const fromJsonFactory = _$RegisterUserFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is RegisterUser &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $RegisterUserExtension on RegisterUser {
  RegisterUser copyWith({String? username, String? email, String? password}) {
    return RegisterUser(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  RegisterUser copyWithWrapped(
      {Wrapped<String>? username,
      Wrapped<String>? email,
      Wrapped<String>? password}) {
    return RegisterUser(
        username: (username != null ? username.value : this.username),
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class ResetPassword {
  const ResetPassword({
    required this.password,
    this.confirmPassword,
    this.email,
    this.token,
  });

  factory ResetPassword.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordFromJson(json);

  static const toJsonFactory = _$ResetPasswordToJson;
  Map<String, dynamic> toJson() => _$ResetPasswordToJson(this);

  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'confirmPassword')
  final String? confirmPassword;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$ResetPasswordFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ResetPassword &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(token) ^
      runtimeType.hashCode;
}

extension $ResetPasswordExtension on ResetPassword {
  ResetPassword copyWith(
      {String? password,
      String? confirmPassword,
      String? email,
      String? token}) {
    return ResetPassword(
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        email: email ?? this.email,
        token: token ?? this.token);
  }

  ResetPassword copyWithWrapped(
      {Wrapped<String>? password,
      Wrapped<String?>? confirmPassword,
      Wrapped<String?>? email,
      Wrapped<String?>? token}) {
    return ResetPassword(
        password: (password != null ? password.value : this.password),
        confirmPassword: (confirmPassword != null
            ? confirmPassword.value
            : this.confirmPassword),
        email: (email != null ? email.value : this.email),
        token: (token != null ? token.value : this.token));
  }
}

@JsonSerializable(explicitToJson: true)
class TaskDto {
  const TaskDto({
    this.id,
    this.description,
    this.taskStatus,
    this.startDay,
    this.deadlineDay,
    this.pomodoroSessions,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  static const toJsonFactory = _$TaskDtoToJson;
  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'taskStatus')
  final int? taskStatus;
  @JsonKey(name: 'startDay')
  final DateTime? startDay;
  @JsonKey(name: 'deadlineDay')
  final DateTime? deadlineDay;
  @JsonKey(name: 'pomodoroSessions')
  final int? pomodoroSessions;
  static const fromJsonFactory = _$TaskDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.taskStatus, taskStatus) ||
                const DeepCollectionEquality()
                    .equals(other.taskStatus, taskStatus)) &&
            (identical(other.startDay, startDay) ||
                const DeepCollectionEquality()
                    .equals(other.startDay, startDay)) &&
            (identical(other.deadlineDay, deadlineDay) ||
                const DeepCollectionEquality()
                    .equals(other.deadlineDay, deadlineDay)) &&
            (identical(other.pomodoroSessions, pomodoroSessions) ||
                const DeepCollectionEquality()
                    .equals(other.pomodoroSessions, pomodoroSessions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(taskStatus) ^
      const DeepCollectionEquality().hash(startDay) ^
      const DeepCollectionEquality().hash(deadlineDay) ^
      const DeepCollectionEquality().hash(pomodoroSessions) ^
      runtimeType.hashCode;
}

extension $TaskDtoExtension on TaskDto {
  TaskDto copyWith(
      {int? id,
      String? description,
      int? taskStatus,
      DateTime? startDay,
      DateTime? deadlineDay,
      int? pomodoroSessions}) {
    return TaskDto(
        id: id ?? this.id,
        description: description ?? this.description,
        taskStatus: taskStatus ?? this.taskStatus,
        startDay: startDay ?? this.startDay,
        deadlineDay: deadlineDay ?? this.deadlineDay,
        pomodoroSessions: pomodoroSessions ?? this.pomodoroSessions);
  }

  TaskDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? description,
      Wrapped<int?>? taskStatus,
      Wrapped<DateTime?>? startDay,
      Wrapped<DateTime?>? deadlineDay,
      Wrapped<int?>? pomodoroSessions}) {
    return TaskDto(
        id: (id != null ? id.value : this.id),
        description:
            (description != null ? description.value : this.description),
        taskStatus: (taskStatus != null ? taskStatus.value : this.taskStatus),
        startDay: (startDay != null ? startDay.value : this.startDay),
        deadlineDay:
            (deadlineDay != null ? deadlineDay.value : this.deadlineDay),
        pomodoroSessions: (pomodoroSessions != null
            ? pomodoroSessions.value
            : this.pomodoroSessions));
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
