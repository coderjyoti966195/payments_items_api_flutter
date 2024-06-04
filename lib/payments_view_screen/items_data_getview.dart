
import 'package:flutter/material.dart';


import '../class_screen/items_api_.dart';
 import '../model_class/items_model_classview.dart';
import 'items_data_patchview.dart';
class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xf38579887),
          title: const Text("Get"),
        ),
        body: RefreshIndicator(child:
        FutureBuilder(future: ItemaApi().getItem(), builder: (context, snapshot) {
          var data=snapshot.data?.items ?? List<Item>.empty();
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {

              return Card(
                child: Container(
                  width: 350,
                  color:Colors.teal,
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("${data[index].name}"),
                            Text("${data[index].amount}"),
                            Text("${data[index].description}"),
                            Text("${data[index].type}"),
                            Text("${data[index].active}"),
                          ],
                        ),
                        Column(
                          children: [
                            MaterialButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdataScreen(id: "${data[index].id}",
                                name: "${data[index].name}", description: "${data[index].description}",),));
                            },child: const Icon(Icons.edit,color:Colors.pink),),
                            MaterialButton(onPressed: (){
                              ItemaApi().deleteItem("${data[index].id}");
                              setState(() {
                                ItemaApi().getItem();
                              });
                            },child: const Icon(Icons.delete,color:Colors.pink ,),)
                          ],
                        )
                      ]
                  ),

                ),




              );
            },);

        },), onRefresh: (){
          return ItemaApi().getItem();
        })
    );
  }
}
