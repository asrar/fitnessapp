import 'dart:async';
import 'dart:convert';
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:http/http.dart' as http;

class SingUpService {
  static Future<bool> browse(query) async {
    http.Response response;
    print("Date query  ${query}");
    response = await http.post(
        /// get the data
        Uri.parse("https://yfitness.com/fitness/public/api/signup?${query}"),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Authorization':
              'Bearer FegGc2loq2FoHcZdPJ2VhQA0jXJYihjBUGSs4rq0qyhNrb1xFabQMV6yFkrx',
        });
    //,headers: {
    //       'Access-Control-Allow-Origin': '*',
    //       'Accept' : 'application/json',
    //       'Authorization':'Bearer ${Overseer.token}',
    //
    //     }
    print("got the response");
    String content = response.body;
      Overseer.printWrapped(content);
    var jString = [content];

    String arr = jString.toString();
    // TODO:We will do this in mroning before election
    // List collection = json.decode(arr);
    // List<RegistrationModel> _userList =
    //     collection.map((json) => RegistrationModel.fromJson(json)).toList();
    print("//printig from service >>> ");
    if (response.statusCode != 200) {
      Overseer.register_status = "user-not-exist";
      Overseer.is_user_Registered = false;

      print("login status from service " + Overseer.register_status);
    } else {
      Overseer.register_status = "verified-user";
      Overseer.is_user_Registered = true;
      // List collection = json.decode(arr);
      // List<RegistrationModel> _userList =
      //     collection.map((json) => RegistrationModel.fromJson(json)).toList();
      print("login status from service else " + Overseer.register_status);
    }

    print("end of listen with status " + Overseer.register_status);
    //  ApiBaseHelper optionsHelper =  new ApiBaseHelper();
    //  print(" ---------- before Final RESPOSE from OPTIONS OPERATION");
    //  final response = await optionsHelper.postHTTP("https://newshop.welldoneapps.net/jsonapi",null);

    return Overseer.is_user_Registered;
  } // end of main top if ( does not contain error )
}
