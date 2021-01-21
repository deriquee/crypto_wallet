import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_firebase/net/firebase_comp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_page.dart';
import 'package:crypto_firebase/net/api_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double bitcoin = 0.0;
  double ethereum = 0.0;
  double tether = 0.0;
  @override
  void initState() {
    getValues();
  }
  getValues()async{
    bitcoin = await getPrice('bicoin');
    ethereum = await getPrice('ethereum');
    tether = await getPrice('tether');
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    getValue(String id,double amount){
      if (id == 'bitcoin'){
        return bitcoin*amount;
      }
      else if(id == 'ethereum'){
        return ethereum*amount;
      }
      else { return tether*amount;}
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color:Colors.white
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child:
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid).collection('Coins').snapshots() ,
            
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if (!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }
              return ListView(
                children: snapshot.data.docs.map((document){
                  return Padding(
                    padding: EdgeInsets.only(top:5.0,left: 15.0,right: 15.0),
                                      child: Container(
                      height: MediaQuery.of(context).size.height/12,
                      decoration: BoxDecoration
                      (borderRadius: BorderRadius.circular(15.0),
                      color: Colors.greenAccent),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                        SizedBox(width:5.0),
                        Text('Coin:${document.id}',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                        Text('Rs.${getValue(document.id,document.data()['Amount']).toStringAsFixed(2)}',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                        IconButton(icon: Icon(Icons.close,color:Colors.red), onPressed: ()async{
                          await removeCoin(document.id);
                        })
                      ],),
                    ),
                  );
                }).toList(),
              );
        
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
        
        
      },
      child: Icon(Icons.add,color: Colors.white,),
      backgroundColor: Colors.greenAccent,),
      
    );
  }
}