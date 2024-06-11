import 'dart:convert';
import 'package:chamcong/core/constants/toast.dart';
import 'package:http/http.dart' as http;

Future handlePostApi(
    {required String url, required Map<String, dynamic> body}) async {
  final fetData = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body));

  if (fetData.statusCode != 200) {
    //Be trả về lỗi thì hiển thị message lên giao diện người dùng
    showToastErr(
        message: jsonDecode(fetData.body)['error']['message'] is String
            ? jsonDecode(fetData.body)['error']['message']
            : 'Lỗi không xác định');
    return null;
  } else {
    return jsonDecode(fetData.body);
  }
}
