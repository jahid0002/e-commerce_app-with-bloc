

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:online/model/product_model.dart';
import 'package:online/utilsh/const.dart'; 


class ProductService{


   Future<List<ProductModel>> getData()async{

     List<ProductModel> productList = []; 

     try{

      final http.Response response = await http.get(Uri.parse(AppName.productUrl));

       if(response.statusCode == 200){

        List list = jsonDecode(response.body); 
        for (var element in list) {productList.add(ProductModel.fromJson(element));}
        return productList;
       } 
       return productList;

     }catch(e){
      throw e.toString();
     }

     


   }

 
   Future<List<String>> getCategory()async{

     List<String> catagoryList = []; 

     try{

      final http.Response response = await http.get(Uri.parse(AppName.categoryUrl));

       if(response.statusCode == 200){

        List list = jsonDecode(response.body); 
        for (var element in list) {  catagoryList.add(element);  }
        return catagoryList;
       } 
       return catagoryList;

     }catch(e){
      throw e.toString();
     }

     


   }



}