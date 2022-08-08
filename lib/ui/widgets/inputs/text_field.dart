import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  @override
 TextEditingController textController = TextEditingController();
  RegExp digitValidator  = RegExp("[0-9]+");
  bool isANumber = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      TextField(
        keyboardType: TextInputType.phone,
        onChanged: (inputValue){
          if(inputValue.isEmpty || digitValidator.hasMatch(inputValue)){
            setValidator(true);
          } else{
            setValidator(false);
          }
        },

        decoration: InputDecoration(
          errorText: isANumber ? null : "Please enter a number"
        ),
      ),
    );
  }
  void setValidator(valid){
    setState(() {
      isANumber = valid;
    });
  }
}
