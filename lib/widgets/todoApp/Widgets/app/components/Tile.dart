import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/todoApp/helpers/Connection.dart';

class Tile extends StatefulWidget {
  int state;
  String text;
  int id;
  int todoId;
  Function fetchData;

  Tile(this.id, this.text, this.state, this.todoId, this.fetchData, {Key? key})
      : super(key: key);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  int? _isChecked;
  final String _val = "Text";

  // String val = "something";
  @override
  void initState() {
    super.initState();
    _isChecked = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: ListTile(
          tileColor: const Color.fromRGBO(127, 77, 255, 190),
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3))),
          style: ListTileStyle.list,
          leading: Checkbox(
            value: _isChecked == 0 ? false : true,
            onChanged: (value) {
              setState(() {
                if (value == false) {
                  _isChecked = 0;
                } else {
                  _isChecked = 1;
                }
                // update table
                Connection()
                    .todoFormUpdate(_isChecked!, widget.id, widget.todoId);
              });
            },
          ),
          title: Text(
            widget.text,
            style: const TextStyle(color: Colors.black87),
          ),
          trailing: TextButton(
            onPressed: () async {
              await Connection().todoDelete(widget.todoId);
              setState(() {
                widget.fetchData();
              });
            },
            child: const Icon(
              Icons.delete_sharp,
              color: Colors.red,
            ),
          ),
        ));
  }
}
