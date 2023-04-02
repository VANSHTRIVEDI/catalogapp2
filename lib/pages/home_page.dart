import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:catalogapp/models/catalog.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/widgets/home_widgets/catalog_header.dart';
import 'package:catalogapp/widgets/home_widgets/catalog_image.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
   
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: Theme.of(context).buttonColor,
          //you will not find buttoncolor directly by 
          //context.canvascolor
          //vx shortform for it

          child: Icon(CupertinoIcons.cart,color: Colors.white,),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                (CatalogModel.items != null && CatalogModel.items.isNotEmpty)?
                  CatalogList().py16().expand():
               
                  CircularProgressIndicator().centered().expand(),
                
              ],
            ),
          ),
        ));
  }
}
