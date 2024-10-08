import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/ui/helpers/loader.dart';
import 'package:olimpiadas_paris/app/core/ui/helpers/messages.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase> 
    extends State<T>  with Loader, Messages{
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
