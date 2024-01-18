import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String number;

  const CustomButton({super.key, required this.number});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  String text='';
  String res='';
  void Click(String value){
    res=text+value;
    print(res);

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () =>Click(widget.number),
        child: Container(
          margin: EdgeInsets.all(10),
          height: 70,
          width: 70,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
          child: Text(widget.number),
        ),
      ),
    );
  }
}
