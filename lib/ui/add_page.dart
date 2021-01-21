import 'package:crypto_firebase/net/firebase_comp.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  List<String> coins = ['bitcoin','ethereum','tether'];
  String defval = 'bitcoin';
  TextEditingController addbc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          
          DropdownButton(value:defval,items:coins.map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(value: value,child: Text(value),);
          }).toList() , onChanged: (String val){
            setState(() {
              defval = val;
            });
          }),
          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width/1.3,
            child: TextFormField(
              controller: addbc,
              decoration: InputDecoration(
                labelText: 'Coin amount'
              ),
            ),
          ),
          Container(width: MediaQuery.of(context).size.width/1.4,
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0 ),
              color: Colors.greenAccent,

              
            ),
            child: MaterialButton(onPressed: ()async{
              await addCoin(defval, addbc.text);
              Navigator.pop(context);
            },
            child: Text('Add'),),)
          
        ]
        
      ),),
    );
  }
}