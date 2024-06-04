import 'package:flutter/material.dart';
  import 'package:payments_items_api_flutter/payments_view_screen/items_data_postview.dart';

void main() {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home:  PostScreen()
     );
   }
 }
