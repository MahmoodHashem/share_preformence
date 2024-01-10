
import 'preference_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Person.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Main(),
  ));
}
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  String savedName = '';
  String savedPassword = '';

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPerson();

  }


  void save() {
   Person person = Person(name.text, password.text);

   PreferenceService preferenceService = PreferenceService();
   preferenceService.savePerson(person);

   name.clear();
   password.clear();

  }

  void getPerson () async {

    PreferenceService preferenceService = PreferenceService();
    final person = await preferenceService.getPerson();
    setState(() {
   savedName = person.name;
   savedPassword= person.password;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Tesst"),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: name,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15)
                     ),
                   ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                  ),
                ),

                ElevatedButton( onPressed: save,
                    child:Text('Save'),),
                SizedBox(
                  height: 15,
                ),

                Container(
                  child: Text("Name: $savedName"),
                ), 
                
                SizedBox(
                 height: 10, 
                ), 
                Container(
                  child: Text('Age: $savedPassword}'),
                ),
                
                ElevatedButton(onPressed: getPerson, child: Text('Show'))


              ],
            )
    );
  }
}
