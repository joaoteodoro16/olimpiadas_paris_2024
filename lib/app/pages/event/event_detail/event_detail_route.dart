
import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/models/event_model.dart';
import 'package:olimpiadas_paris/app/pages/event/event_detail/event_detail_page.dart';
import 'package:provider/provider.dart';

class EventDetailRoute {
  
  EventDetailRoute._();


  static Widget get pages => MultiProvider(providers: [
    Provider(create: (context) => Container(),)
  ],
  builder: (context, child){
    final args = ModalRoute.of(context)?.settings.arguments as EventModel;

    return EventDetailPage(event: args,);
  },
  );



}