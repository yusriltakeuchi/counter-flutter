import 'package:counter/core/viewmodels/counter_provider.dart';
import 'package:counter/screen/detail_screen.dart';
import 'package:counter/screen/inherit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CounterProvider(),
          )
        ],
        child: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {

  void navigateNext(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => DetailScreen()
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Consumer<CounterProvider>(
        builder: (context, counterProv, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                counterProv.number.toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 180,
                child: Center(
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      counterProv.addNumber(1);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.white,),
                        SizedBox(width: 10),
                        Text(
                          "Add Number",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),
              Container(
                width: 180,
                child: Center(
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      counterProv.removeNumber(1);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.remove, color: Colors.white,),
                        SizedBox(width: 10),
                        Text(
                          "Remove Number",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),
              Container(
                width: 180,
                child: Center(
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      navigateNext(context);

                      //Pemanggilan inherit
                      // print(InheritNose.of(context).nouseType);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.navigate_next, color: Colors.white,),
                        SizedBox(width: 10),
                        Text(
                          "Move new Screen",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      )
    );
  }
}