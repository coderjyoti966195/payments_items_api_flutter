// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import '../class_screen/items_api_.dart';
// import '../class_screen/items_minix.dart';
// import 'items_data_getview.dart';
//
// class UserPostScreen extends StatelessWidget with ViewTextfield {
//   UserPostScreen({super.key});
//
//   final nameController = TextEditingController();
//   final DescriptionController = TextEditingController();
//   final amountController = TextEditingController();
//   final currencyController = TextEditingController();
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Text("PostPage"),
//       ),
//       body: GetBuilder(
//         init: ItemsClass(),
//         builder: (controller) {
//           return Column(
//             children: [
//               myTextfield("name", nameController),
//               myTextfield("Description", DescriptionController),
//               myTextfield("amount", amountController),
//               myTextfield("currency", currencyController),
//               MaterialButton(
//                   color: Colors.blue,
//                   child: const Text("data"),
//                   onPressed: () async{
//                     await controller
//                         .itemsUserPost(
//                             nameController.text,
//                         DescriptionController.text,
//                             int.parse(
//                               amountController.text,
//                             ),
//                             currencyController.text)
//                         .then((value) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ItemsScreenView(),
//                           ));
//                     });
//                   })
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../class_screen/items_api_.dart';
import '../class_screen/items_minix.dart';
import 'item_get_class.dart';


class PostScreen extends StatelessWidget with ViewWidget {
  PostScreen({super.key});

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var amountController = TextEditingController();
  var currencyController = TextEditingController();
  var api = ItemaApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xf385798878999),
        title: const Text("Post"),
      ),
      body: Column(
        children: [
          myTextfield(nameController, "Name"),
          myTextfield(descriptionController, "Description"),
          myTextfield(amountController, "Amount"),
          myTextfield(currencyController, "Currency"),
          MaterialButton(
            color: const Color(0xf38579887),
            onPressed: () {
              api.postItem(nameController.text,
                  descriptionController.text,
                  int.parse(amountController.text),
                  currencyController.text);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetIdscreen(),));
            }, child: const Text("post"),)

        ],
      ),
    );
  }
}