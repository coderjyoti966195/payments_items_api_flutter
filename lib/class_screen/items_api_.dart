// import 'dart:convert';
//  import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;
//
// import '../model_class/items_model_classview.dart';
//
// //POAT.....................
// class ItemsClass extends GetxController {
//
//   Future<void> itemsUserPost(
//       String name,
//       String description,
//       int amount,
//       String currency,
//       ) async {
//     var headers = {
//       "Authorization": 'Basic ${base64Encode(
//         utf8.encode(
//             '${'rzp_test_fDHQt7hg7IlYBv'}:${'SzSUd2fe3n5NO8KragWwfKsc'}'),
//       )}'
//     };
//     var url = Uri.parse("https://api.razorpay.com/v1/items");
//     try {
//       var response = await http.post(
//         url,
//         headers: headers,
//         body:  {
//
//           "name": name,
//           "description": deprecated,
//           "amount":amount.toString(),
//           "currency": currency
//         }
//         ,
//       );
//       if (response.statusCode == 200) {
//         print("Success..");
//       } else {
//         print("no success");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
//
//   //get wala
//
//
//
//
//
//   Future<ItemsModelClass> ItemsUserGet() async {
//     var headers = {
//       "Authorization":
//       'Basic ${base64Encode(utf8.encode(
//           '${'rzp_test_fDHQt7hg7IlYBv'}:${'SzSUd2fe3n5NO8KragWwfKsc'}'))}'
//     };
//
//     var response = await http
//         .get(
//         Uri.parse("https://api.razorpay.com/v1/items"), headers: headers);
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       var getOrder = ItemsModelClass.fromJson(data);
//       print(response);
//       return getOrder;
//     } else {
//       return ItemsUserGet();
//     }
//   }
//
//   //patchh........
//   Future<void> ItemsPatch(
//       String  id,
//       String contact,
//       String name,
//       String description
//       ) async {
//     var headers = {
//       "Authorization": 'Basic ${base64Encode(
//         utf8.encode(
//             '${'rzp_test_fDHQt7hg7IlYBv'}:${'SzSUd2fe3n5NO8KragWwfKsc'}'),
//       )}',
//      };
//
//     var url = Uri.parse("https://api.razorpay.com/v1/items/:id /$id");
//     try{
//       var response = await http.put(
//         url,
//         headers: headers,
//         body: json.encode({"name":name,"description":description,"contact":contact,"description":description}),
//       );
//       if (response.statusCode == 200) {
//         print(response.body);
//
//       }
//       else {
//         print("Failed with status:${response.statusCode}");
//       }
//     }
//     catch (e) {
//       print("Error: $e");
//     }
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//

import 'dart:convert';

  import 'package:http/http.dart' as http;

import '/model_class/item_class_model.dart';
import '/model_class/items_model_classview.dart';
class ItemaApi{
  postItem(String name,String description,int amount,String currency)async{
    var url=Uri.parse("https://api.razorpay.com/v1/items");
    var headers={
      "Authorization": 'Basic ${base64Encode(
        utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
     };
    var respons= await http.post(url,headers:headers,body: json.encode(
        {
        "name":name,
        "description":description,
        "amount": amount,
        "currency": currency
        }) );
    try{
      if(respons.statusCode==200){
         print("succesful");
      }
      else{
        print("not succesful");

      }
    }catch(error){
      print("$error");
    }

  }
  Future<ItemsModal>getItemId()async{
    var url=Uri.parse("https://api.razorpay.com/v1/items/item_OF5Ir77T1bQ77E");
    var headers={
      "Authorization": 'Basic ${base64Encode(
        utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
     };
    var respons=await http.get(url,headers:headers);
    if(respons.statusCode==200){
      var decode=jsonDecode(respons.body);
      var data=ItemsModal.fromJson(decode);
      return data;
    }
    else{
      return ItemsModal();
    }
  }
  Future<ItemModal>getItem()async{
    var url=Uri.parse("https://api.razorpay.com/v1/items");
    var headers={
      "Authorization": 'Basic ${base64Encode(
        utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
     };
    var respons=await http.get(url,headers:headers);
    if(respons.statusCode==200){
      var decode=jsonDecode(respons.body);
      var data=ItemModal.fromJson(decode);
      return data;
    }
    else{
      return ItemModal();
    }
  }
  deleteItem(String id)async{
    var url=Uri.parse("https://api.razorpay.com/v1/items/$id");
    var headers={
      "Authorization": 'Basic ${base64Encode(
        utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
     };
    var respons=await http.delete(url,headers:headers );
    if(respons.statusCode==200){
      print("succesful");
    }else{
      print(" not succesful");
    }
  }
  updataItem(String name,String description,String id,)async{
    var url=Uri.parse("https://api.razorpay.com/v1/items/$id");
    var headers={
      "Authorization": 'Basic ${base64Encode(
        utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
     };
    var respons= await http.patch(url,headers:headers,body: json.encode({
      "name":name,
      "description":description
    }) );

    if(respons.statusCode==200){
      print("succesful");
    }
    else{
      print("not succesful");
    }
  }

}
