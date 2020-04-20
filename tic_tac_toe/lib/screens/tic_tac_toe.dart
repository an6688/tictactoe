import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TicTacToe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TicTacToeState();
  }
}

List<List> _matrix;

class _TicTacToeState extends State<TicTacToe>{
  _TicTacToeState()
  {
    _matrix = List<List>(3);
    for (var i = 0; i < _matrix.length; i++){
      _matrix[i] = List(3);
      for (var j = 0; j < _matrix[i].length; j++){
        _matrix[i][j] = ' ';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("tic tac toe"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // pass the x and y coordinates for the matric
                  _buildElement(0, 0),
                  _buildElement(0, 1),
                  _buildElement(0, 2),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildElement(1, 0),
                      _buildElement(1, 1),
                      _buildElement(1, 2),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildElement(2, 0),
                      _buildElement(2, 1),
                      _buildElement(2, 2),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }

  String _prevChar = 'o';

  _buildElement(int i, int j) {
    return GestureDetector(
        onTap: (){
          _changeField(i, j);
        },
        child: Container(
          width: 90.0,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                  color: Colors.black
              )
          ),
          child: Center(
            child: Text(
                _matrix[i][j],
                style: TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                )
            ),
          ),
        ));
  }
  _changeField(int i, int j)
  {
    setState(() {
      if (_matrix[i][j] == ' ') {
        if (_prevChar == 'O')
          _matrix[i][j] = 'X';

        else
          _matrix[i][j] = 'O';

        _prevChar = _matrix[i][j];
      }
    });
  }
}
