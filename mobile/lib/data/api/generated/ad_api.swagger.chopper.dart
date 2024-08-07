part of 'ad_api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AdApi extends AdApi {
  _$AdApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AdApi;

  @override
  Future<Response<dynamic>> _apiAuthenticationPost(
      {required RegisterUser? body}) {
    final Uri $url = Uri.parse('/api/Authentication');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiAuthenticationConfirmEmailGet({
    String? token,
    String? email,
  }) {
    final Uri $url = Uri.parse('/api/Authentication/ConfirmEmail');
    final Map<String, dynamic> $params = <String, dynamic>{
      'token': token,
      'email': email,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiAuthenticationLogInPost(
      {required LoginModel? body}) {
    final Uri $url = Uri.parse('/api/Authentication/LogIn');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiAuthenticationLogIn2FAPost(
      {required LoginOTPModel? body}) {
    final Uri $url = Uri.parse('/api/Authentication/LogIn-2FA');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiAuthenticationForgotPasswordPost(
      {required String? email}) {
    final Uri $url = Uri.parse('/api/Authentication/ForgotPassword');
    final Map<String, dynamic> $params = <String, dynamic>{'email': email};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiAuthenticationResetPasswordGet({
    String? token,
    String? email,
  }) {
    final Uri $url = Uri.parse('/api/Authentication/ResetPassword');
    final Map<String, dynamic> $params = <String, dynamic>{
      'token': token,
      'email': email,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiAuthenticationResetPasswordPost(
      {required ResetPassword? body}) {
    final Uri $url = Uri.parse('/api/Authentication/ResetPassword');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiAuthenticationDeleteUserDelete(
      {required String? email}) {
    final Uri $url = Uri.parse('/api/Authentication/DeleteUser');
    final Map<String, dynamic> $params = <String, dynamic>{'email': email};
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiCalendarRecordGetRecordsGet() {
    final Uri $url = Uri.parse('/api/calendarRecord/getRecords');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiCalendarRecordGetRecordIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/calendarRecord/getRecord/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiCalendarRecordCreateRecordPost(
      {required CalendarRecordDto? body}) {
    final Uri $url = Uri.parse('/api/calendarRecord/createRecord');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiCalendarRecordEditRecordIdPut({
    required int? id,
    required CalendarRecordDto? body,
  }) {
    final Uri $url = Uri.parse('/api/calendarRecord/editRecord/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiCalendarRecordDeleteIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/calendarRecord/delete/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiPillsGet() {
    final Uri $url = Uri.parse('/api/pills');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiPillsIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/pills/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiPillsIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/pills/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiPillsNewPost({required PillDto? body}) {
    final Uri $url = Uri.parse('/api/pills/new');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiPillsEditIdPut({
    required int? id,
    required PillDto? body,
  }) {
    final Uri $url = Uri.parse('/api/pills/edit/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiTasksGet() {
    final Uri $url = Uri.parse('/api/tasks');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiTasksIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/tasks/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiTasksIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/tasks/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiTasksNewPost({required TaskDto? body}) {
    final Uri $url = Uri.parse('/api/tasks/new');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiTasksEditIdPut({
    required int? id,
    required TaskDto? body,
  }) {
    final Uri $url = Uri.parse('/api/tasks/edit/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
