
import 'Person.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService{

  Future savePerson (Person person) async{

    // final pre = await SharedPreferences.getInstance();
    SharedPreferences pre=await SharedPreferences.getInstance();

    pre.setString('name', person.name);
    pre.setString('password', person.password);

  }

  Future<Person> getPerson () async {

    final pre = await SharedPreferences.getInstance();

    String name = pre.getString('name')!;
    String password = pre.getString('password')!;


    return Person(name, password);
  }



}