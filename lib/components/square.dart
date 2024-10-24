import 'package:chess/components/piece.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';

class Square extends StatelessWidget {
  const Square({
    super.key,
    required this.isWhite,
    required this.isSelected,
    this.piece,
    this.onTap, required this.isValidMove,
  });

  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    // If selected square is open
    if (isSelected) {
      squareColor = Colors.green;
    }

    else if(isValidMove){
      squareColor = Colors.green[200];
    }

    // Otherwise, it's white or black
    else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        margin: EdgeInsets.all(isValidMove? 5 : 0),
        padding: EdgeInsets.all(5),
        child: piece != null
            ? Center(
                child: Image.asset(
                  piece!.imagePath,
                  color: piece!.isWhite ? Colors.white : Colors.black,
                  //height: 40,
                  //width: 40,
                ),
              )
            : null,
      ),
    );
  }
}
