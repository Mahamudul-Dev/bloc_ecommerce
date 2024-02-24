import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce/app.dart';
import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = EcommerceBlocObserver();
  runApp(const BlocEcommerceApp());
}