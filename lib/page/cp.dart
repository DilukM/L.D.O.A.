import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:date_field/date_field.dart';
//import 'package:dropdownfield/dropdownfield.dart';

class CpForm extends StatefulWidget {
  const CpForm({Key key}) : super(key: key);

  @override
  State<CpForm> createState() => _CpFormState();
}

class _CpFormState extends State<CpForm> {
  final GlobalKey<FormState> _CpFormKey = GlobalKey<FormState>();
  String _name;
  DateTime _date;
  String _employeeCount;
  String _caseNo;
  String _toDo;
  DateTime _lastDate;
  String _remarks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Color.fromARGB(255, 255, 191, 0),
        title: Text('CP Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _CpFormKey,
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              children: [
                //Date input field======
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Date',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value.day);
                  },
                  onSaved: (date) {
                    _date = date;
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                //Visiting place =========
                TextFormField(
                    decoration: InputDecoration(
                      // hintText: 'Name & the Address of the Visit',
                      border: OutlineInputBorder(),
                      labelText: 'Name & the Address of the Visit',
                    ),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Field can not be empty';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      _name = text;
                    }),
                SizedBox(
                  height: 7,
                ),
                //No of emplotees input field========
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No of Employees',
                    ),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Field can not be empty';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      _employeeCount = text;
                    }),
                SizedBox(
                  height: 7,
                ),
                //Case number input field========
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No of File / Case',
                    ),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Field can not be empty';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      _caseNo = text;
                    }),
                SizedBox(
                  height: 7,
                ),
                //Work to be done input=======
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Work to be Done',
                    ),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Field can not be empty';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      _toDo = text;
                    }),
                SizedBox(
                  height: 7,
                ),
                //last visited date input========
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Date of last visit',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                  onSaved: (date) {
                    _lastDate = date;
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                //Remarks input field========
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Special Remarks',
                    ),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Field can not be empty';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      _remarks = text;
                    }),
                SizedBox(
                  height: 50,
                ),
                //Button=======
                Container(
                  child: ElevatedButton(
                    child: Text('Save'),
                    onPressed: () {
                      if (_CpFormKey.currentState.validate()) {
                        _CpFormKey.currentState.save();
                      }
                      return print(_date);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
