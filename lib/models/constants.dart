import 'package:flutter/material.dart';

Color myColor = const Color(0xff62973A);

InputDecoration authInputDecoration = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: Color(0xffbcbcbc),
      width: 1
    )
  ),
  disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
          color: Color(0xffbcbcbc),
          width: 1
      )
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
          color: myColor,
          width: 2
      )
  ),
);