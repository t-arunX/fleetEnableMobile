import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/todoApp/Widgets/app/components/Tile.dart';
import 'package:flutter_projects/widgets/todoApp/helpers/Connection.dart';

import '../../../../main.dart';
import '../../models/Todo.dart';

class FirstPage extends StatefulWidget {
  List lst = [];
  int id;

  FirstPage(this.id, this.lst, {Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  Todo todo = Todo();
  int count = 0;
  List lst = [];

  List getList() {
    // print(widget.id);
    Function fun = fetchData;
    List result = <Widget>[];
    for (var i in lst) {
      result.add(Tile(widget.id, i['text'], i['state'], i['todoId'], fun));
    }
    lst = result;
    return result;
  }

  Future<void> fetchData() async {
    final response = await Connection().getTodoList(widget.id);
    print(widget.id);
    if (response != null) {
      setState(() {
        lst = response;
      });
      getList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.list_alt_rounded, color: Colors.white70),
        backgroundColor: Colors.deepPurpleAccent,
        shadowColor: Colors.purple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: PopupMenuButton(
              color: Colors.white,
              elevation: 10,
              enableFeedback: mounted,
              itemBuilder: (BuildContext context) {
                const Color color = Colors.black54;
                return [
                  const PopupMenuItem(
                    // padding: EdgeInsets.only(left:30),
                    height: 10,
                    value: 1,
                    child: Text(
                      'Logout',
                      style: TextStyle(color: color),
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                Log().logout(context);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        // margin: 20,
        child: Form(
          key: _formKey,
          child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'add new task',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      content: TextFormField(
                        onChanged: (value) {
                          todo.text = value;
                          todo.state = 0;
                        },
                        onSaved: (value) {
                          todo.text = value;
                          todo.state = 0;
                        },
                        decoration: InputDecoration(
                          labelText: "Describe",
                          labelStyle: const TextStyle(color: Colors.black45),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        OutlinedButton(
                          onPressed: () async {
                            // Do something
                            todo.id = widget.id;
                            _formKey.currentState?.save();
                            try {
                              await Connection().todoFormInsert(todo);
                            } catch (ex) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(ex.toString())));
                            }
                            setState(() {
                              count++;
                              fetchData();
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('add'),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // Do something
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.add)),
        ),
      ),
      body: Center(
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            Text(
              'New tasks added: $count',
              style: TextStyle(color: Colors.grey),
            ),
            ...lst
          ],
        ),
      ),
    );
  }
}
