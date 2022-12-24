import 'dart:convert';
import 'package:http/http.dart' as http;

class databas {
  getreq(String uri) async {
    try {
      var res = await http.get(Uri.parse(uri));
      if (res.statusCode == 200) {
        var resdar = jsonDecode(res.body);
        return resdar;
      } else {
        print("errer conection");
      }
    } catch (e) {
      print(e);
    }
  }

  postreq(String uri, Map data) async {
    try {
      var res = await http.post(Uri.parse(uri), body: data);
      if (res.statusCode == 200) {
        var resdar = jsonDecode(res.body);
        print(resdar);
        return resdar;
      } else {
        print("errer conection");
        print(res.statusCode);
      }
    } catch (e) {
      print("${e}=================");
    }
  }
}
