import 'package:flutter/material.dart';
void main(){
  runApp((MaterialApp(home: Calculator(),debugShowCheckedModeBanner: false,)));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
   String number='';
  String text='';
  String res='';
  int first=0,second=0;
  String opp='';
  Future<void> Click(String value) async {
    if(value=='AC'){
      res='';
      text='';
      first=0;
      second=0;
      opp='';
    }
    else if(value=='+'||value=='-'||value=='/'||value=='*'||value=='%'){
      first=int.parse(text);
      res='';
      opp=value;
    }
    else if(value == '='){
      second=int.parse(text);
      if(opp=='+'){
        res=(first+second).toString();
      }
      if(opp=='-'){
        res=(first-second).toString();
      }
      if(opp=='*'){
        res=(first*second).toString();
      }
      if(opp=='/'){
        res=(first~/second).toString();
      }
      if(opp=='%'){
        res=(first%second).toString();
      }
    }
    else{
      res=int.parse(text+value).toString();
      print(opp);
    }
    setState(() {
      text=res;
    });
  }
  bool color(String x){
    if(x=='+'||x=='-'||x=='/'||x=='*'||x=='%'||x=='='){
      return true;
    }
    else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
          Expanded(child: Container(
            alignment: Alignment(.8,.7),
            child: Text(text,style:TextStyle(fontSize: 35,fontWeight: FontWeight.w700)),),),
          Row(
            children: [
              CustomButton(number: 'AC',),
              CustomButton(number: 'Del',),
              CustomButton(number: '%',),
              CustomButton(number: '/',),
            ],
          ),
          Row(
           children: [
             CustomButton(number: '9',),
             CustomButton(number: '8',),
             CustomButton(number: '7',),
             CustomButton(number: '*',),
           ],
         ),
          Row(
            children: [
              CustomButton(number: '6',),
              CustomButton(number: '5',),
              CustomButton(number: '4',),
              CustomButton(number: '-',),
            ],
          ),
          Row(
            children: [
              CustomButton(number: '3',),
              CustomButton(number: '2',),
              CustomButton(number: '1',),
              CustomButton(number: '+',),
            ],
          ),
          Row(
            children: [
              CustomButton(number: '',),
              CustomButton(number: '0',),
              CustomButton(number: '.',),
              CustomButton(number: '=',),
            ],
          )
        ],
      )
    );
  }
  Widget CustomButton({required String number}){
    return Expanded(
      child: GestureDetector(
        onTap: () =>Click(number),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          decoration: color(number)? BoxDecoration(color:Colors.orange.shade500, shape: BoxShape.circle):const BoxDecoration(color:Colors.black87, shape: BoxShape.circle),
          child: color(number)? Text(number,style: TextStyle(color: Colors.orange.shade50,fontSize: 20),):Text(number,style:const  TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }
}