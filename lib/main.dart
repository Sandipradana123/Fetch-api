import 'package:fetching_api2/model/book.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fetch api',
      home: FetchAPI()
    );
  }
}

class FetchAPI extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Fetch api'),centerTitle: true,backgroundColor: Colors.blue,),
      body: Container(
        child: FutureBuilder(
  future: BookModel.fetch(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      var data = snapshot.data; 
      print(data);

      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext, int index){
          var item = data[index];

          return Column(
            children: [
              Text(item['volumeInfo']['title']),
              Text(item['volumeInfo']['subtitle'])
            ],
          );
        }
        );

  
    }
  },
),

      ),
    );
  }
}

