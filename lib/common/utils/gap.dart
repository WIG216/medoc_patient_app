import 'package:flutter/material.dart';

extension Gap on num{
 Widget get height{
  return SizedBox(
    height: toDouble(),
  );
 } 
 Widget get width{
  return SizedBox(
    width: toDouble(),
  );
 } 
}