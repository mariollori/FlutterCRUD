import 'dart:html';
import 'dart:convert';
import 'package:examenam/models/posts.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

class CrudRepo{

      Future<List<dynamic>> getPosts() async{

       final response = await http.get(Uri.parse('https://httpexamen.herokuapp.com/posts/getpost'));

       List<dynamic> decode = json.decode(response.body);
      print(decode);
      
       return  decode;
        
      }


      deletepost(id) async{
            final res = await http.delete(Uri.parse('https://httpexamen.herokuapp.com/posts/eliminarpost/$id'));


            print(res);
      }
      
    Future<bool> crearpost(titulo,descripcion) async{
    final url = Uri.parse('https://httpexamen.herokuapp.com/posts/crearpost');
    Map data = {
        'post':{'titulo':titulo,'descripcion':descripcion},
    };

       Map<String,String> heade ={
         "content-type" : "application/json",
         "accept" : "application/json",
     };
    
    print(data);
    final response =await http.post(url ,headers:heade , body: jsonEncode(data));

    final decode= jsonDecode(response.body);
     
    if(response.statusCode == 200||response.statusCode == 304){
     print(decode);
       return true;
    }else{

    return false;
    }

    
    

    

  }

   Future<bool> update(titulo,descripcion,id) async{
    final url = Uri.parse('https://httpexamen.herokuapp.com/posts/modpost');
    Map data = {
        'post':{'titulo':titulo,'descripcion':descripcion,'idpost':id},
    };

       Map<String,String> heade ={
         "content-type" : "application/json",
         "accept" : "application/json",
     };
    
    print(data);
    final response =await http.put(url ,headers:heade , body: jsonEncode(data));

    final decode= jsonDecode(response.body);
     
    if(response.statusCode == 200||response.statusCode == 304){
     print(decode);
       return true;
    }else{

    return false;
    }

    
    

    

  }

}

