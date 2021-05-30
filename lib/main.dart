import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class Pizza {
  String _topping;
  double _price;
  int _size;
  String strSize;
  String description;

  final PIZZA_PRICES = [7.99, 9.99, 12.99, 14.99];
  final PIZZA_SIZES = ["Small", "Medium", "Large", "X-Large"];

  Pizza(String this._topping, int this._size) {
    _price = PIZZA_PRICES[_size];
    strSize = PIZZA_SIZES[_size];
    description = "$strSize $_topping pizza";
  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pizza Order'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Pizza> pizzaList;

  void _addPizza() {
    final pizzaToppingTextField = TextEditingController();
    int _sizeSelected = 1;
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: SizedBox(
                height: 200,
                child:  Column(
                  children: <Widget>[
                    Text(
                      'Toppings:',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextField(
                      controller: pizzaToppingTextField,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    DropdownButton(
                        style: Theme.of(context).textTheme.headline4,
                        value: _sizeSelected,
                        items:[
                          DropdownMenuItem(child: Text("Small"), value: 0),
                          DropdownMenuItem(child: Text("Medium"), value: 1),
                          DropdownMenuItem(child: Text("Large"), value: 2),
                          DropdownMenuItem(child: Text("X-Large"), value: 3)
                        ],
                        onChanged: (value) {
                          setState(() {
                            _sizeSelected = value;
                          });
                        }),
                    ElevatedButton(
                      child: Text('Add Pizza'),
                      onPressed: () {
                        print("Adding a pizza");
                        setState(() {
                          Pizza newPizza = new Pizza(pizzaToppingTextField.text, _sizeSelected);
                          pizzaList.add(newPizza);
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: pizzaList.length,
        itemBuilder: (BuildContext context, int position) {
          return ListTile(
            title: Text(pizzaList[position].toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPizza,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}






