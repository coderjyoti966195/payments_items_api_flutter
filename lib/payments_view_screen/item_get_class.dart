import 'package:flutter/material.dart';

import '../class_screen/items_api_.dart';
import 'items_data_getview.dart';


class GetIdscreen extends StatelessWidget {
  GetIdscreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xf3857988767889),
          title: const Text("GetId"),
        ),
        body: Column(
          children: [
            RefreshIndicator(child:
            FutureBuilder(future:ItemaApi().getItemId(), builder:(context, snapshot) {
              var data=snapshot.data;
              return Column(
                children: [
                  Text("${data?.name}"),
                  Text("${data?.amount}"),
                  Text("${data?.description}"),
                  Text("${data?.type}"),
                  Text("${data?.active}"),
                ],
              );
            }, ), onRefresh: () {
              return ItemaApi().getItemId();
            },),
            MaterialButton(
              color:const Color(0xf38579887),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>GetScreen() ,));
              },child: Text("Getdata"),)
          ],
        )

    );
  }
}