// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import '../class_screen/items_api_.dart';
//
// class PatchUpdateScreen extends StatefulWidget {
//   String Id; // Pass the customer ID
//   String name;
//   String description;
//   int amount;
//
//   PatchUpdateScreen({
//     Key? key,
//     required this.Id,
//     required this.name,
//     required this.description,
//     required this.amount,
//   }) : super(key: key);
//
//   @override
//   PatchUpdateScreenState createState() => PatchUpdateScreenState();
// }
//
// class PatchUpdateScreenState extends State<PatchUpdateScreen> {
//   final nameController = TextEditingController();
//   final IdController = TextEditingController();
//   final descriptionController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.name;
//     IdController.text = widget.Id;
//     descriptionController.text = widget.description;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text(
//             "patch Update Screen",
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.blueGrey),
//       body: GetBuilder<ItemsClass>(
//         init: ItemsClass(),
//         builder: (controller) {
//           return Column(
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               textField("Name", nameController),
//               textField("Id", IdController),
//               textField("description", descriptionController),
//               MaterialButton(
//                 color: Colors.blueGrey,
//                 child:
//                     const Text("Update", style: TextStyle(color: Colors.white)),
//                 onPressed: () async {
//                   await controller.ItemsPatch(
//                     //PROBLEM//
//                     widget.Id,
//                     IdController.text,
//                     nameController.text,
//                     descriptionController.text,
//                   );
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget textField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: const OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../class_screen/items_api_.dart';
import '../class_screen/items_minix.dart';


class UpdataScreen extends StatefulWidget {
  String id;
  String name;
  String description;

  UpdataScreen({required this.id,required this.name,required this.description,});

  @override
  State<UpdataScreen> createState() => _UpdataScreenState();
}

class _UpdataScreenState extends State<UpdataScreen> with ViewWidget {
  @override
  var nameController = TextEditingController();

  var descriptionController = TextEditingController();

  Widget build(BuildContext context) {
    nameController = TextEditingController(text: widget.name);
    descriptionController = TextEditingController(text: widget.description);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xf38579887),
        title: const Text("Updata"),
      ),
      body: Column(
        children: [
          myTextfield(nameController),
          myTextfield(descriptionController),
          MaterialButton(
            color: const Color(0xf38579887),
            onPressed: () {
              ItemaApi().updataItem(

                nameController.text,
                descriptionController.text,
                widget.id,

              );

              Navigator.pop(context);
            }, child: Text("updata"),)
        ],
      ),
    );
  }
}

