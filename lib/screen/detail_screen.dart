import 'package:counter/core/viewmodels/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider ( 
        providers: [ 
          ChangeNotifierProvider   ( 
            create: (context) => CounterProvider(),
          ), 
        ], 
        child: DetailBody(),
      )
    );
  }
}

class DetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProv = Provider.of<CounterProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          counterProv.number.toString(),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}