import 'package:flutter/material.dart';

class TexInput extends StatelessWidget {
  const TexInput({
    Key key,
    @required Function showpicker,
    @required Function add_do,
    @required TextEditingController typeValue,
    @required TextEditingController titleValue,
  })  : _typeValue = typeValue,
        _showpicker = showpicker,
        _titleValue = titleValue,
        _add_do = add_do,
        super(key: key);

  final TextEditingController _typeValue;
  final TextEditingController _titleValue;
  final Function _add_do;
  final Function _showpicker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column
        
        (
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'type',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 4))),
              controller: _typeValue,
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 4))),
              controller: _titleValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    onPressed: _showpicker,
                    child: Text(
                      "Take a date !",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          shadows: [Shadow(blurRadius: 10, color: Colors.grey)]),
                    )),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.green,
                  onPressed: _add_do,
                  child: Text('ok',style: TextStyle(color: Colors.yellow),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
