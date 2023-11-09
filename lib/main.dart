import 'package:flutter/material.dart';
import'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  int sum = 0;
  String leftstat = '';
  String rightstat = '';
  String comp = '';
  @override
  Widget build(BuildContext context) {
    sum = left + right;
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Player 1: $leftstat',
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
              Text('Player 2: $rightstat',
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
          Center(
          child: Row(
            children:[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                          ChangeValue();
                          compare();
                        });
                        print('Left image is clicked');
                      },
                      child: Image.asset('images/dice$left.png')),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                          ChangeValue();
                          compare();
                        });
                        print('Right image is clicked');
                      },
                      child: Image.asset('images/dice$right.png')),
                ),
              ),
            ],
          ),
    ),
          Column(
            children: [
              Text('The total roll is $sum',
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
              Text('$comp',
                style: const TextStyle(
                fontSize: 25.0,
                ),
              ),
            ],
          )
        ],
      );
  }

  void ChangeValue(){
    left = 1+Random().nextInt(6);
    right = 1+Random().nextInt(6);
  }

  void compare(){
   if(left > right){
      comp = 'Left dice rolls higher';
      leftstat = 'WINNER';
      rightstat = 'LOSER';
   }else if(left < right){
     comp = 'Right dice rolls higher';
     leftstat = 'LOSER';
     rightstat = 'WINNER';
   }else{
     comp = 'Dice roll are equal';
     leftstat = 'TIE';
     rightstat = 'TIE';
   }
  }
}

