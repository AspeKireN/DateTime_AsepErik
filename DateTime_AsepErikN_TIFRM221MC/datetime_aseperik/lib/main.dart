import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  DateTime? dateTimenow, dateTimeTomorrow;
  var year, month, day;
  TimeOfDay? picked_time, selectedTime=TimeOfDay.now();

  Future<Null> getDate(BuildContext context) async{
    picked_date = await showDatePicker(
    context: context, 
    initialDate: dateTimenow!,
    firstDate: DateTime(dateTimenow!.year -1), 
    lastDate: DateTime(dateTimenow!.year + 1));

    if (picked_date != null && picked_date != dateTimenow){
      SetState((){
        dateTimenow = picked_date;
      });
    }
  }
    Future<Null> getTime(BuildContext context) async{
      picked_time = await showTimePicker(
        context: context, 
        initialTime: selectedTime!,
        );
        log(picked_time.toString());

        if (picked_time != null && picked_time != selectedTime) {
          setState((){
            selectedTime = picked_time;
            log("test"+picked_time.toString());
          });
        }
  }   

  

  // This widget is the root of your application.
  void dateTime_method(
    dateTimenow = new DateTime.now();
    dateTimeTomorrow = dateTimenow!.add(const Duration(days: 1));
    year = dateTimenow!.year;
    month = dateTimenow.month;
    day = dateTimenow.day;

    var data = DateFormat ('HH:mm:ss').format(dateTimeNow!);
    var data1 = DateFormat ('dd MMMM yyyy').format(dateTimeNow!);
    var data2 = DateFormat ('HH:mm').format(dateTimeNow!);
    var data3 = DateFormat ('HH:mm:ss').format(dateTimeNow!);
    var data4 = DateFormat ('yyyy-MM-dd').format(dateTimeNow!);
    var data5 = DateFormat.now ().add(Duration(days:-1));

    log("data 1 " + data1.toString());
    log("data 2 " + data2.toString());
    log("data 3 " + data3.toString());
    log("data 4 " + data4.toString());
    log("data 5 " + data5.toString());
    log("year " + year.toString());
    log("month " + month.toString());
    log("day  " + day.toString());
  ){

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: (){getDate(context);},
            child: Text("Test DatePicker"),
            ),
          MaterialButton(
            onPressed: (){getTime(context);},
            child: Text("Test TimePicker"),
            ),
          Text("${dateTimenow.toString().substring(0,10)}"),
          Text("${selectedTime.toString().substring(0,10)}"),
        ],
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
