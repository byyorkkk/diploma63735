import 'dart:convert';

List<Map<String, dynamic>> decodeApiQuery(String bodyString) {
  return (jsonDecode(bodyString) as List<dynamic>)
      .map(
        (e) => Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
      )
      .toList();
}
