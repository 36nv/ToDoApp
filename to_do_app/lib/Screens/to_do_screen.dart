import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/Model/to_do_model.dart';
import 'package:to_do_app/Screens/add_to_do_screen.dart';
import 'package:to_do_app/Service/auth_Service.dart';
import 'package:to_do_app/Widgets/bold_text_widgets.dart';
import 'package:to_do_app/Widgets/search_widget.dart';
import 'package:to_do_app/Widgets/to_do_widget.dart';
import 'package:to_do_app/constants/navigation.dart';
import 'package:to_do_app/constants/spacings.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  Future<List<ToDoModel>?>? _todoListFuture;
  List<ToDoModel>? searchResults;

  @override
  void initState() {
    super.initState();
    _todoListFuture = _loadTodoData();
  }

  Future<List<ToDoModel>?> _loadTodoData() async {
    try {
      final todoData =
          await SupabaseService(Supabase.instance.client).getTodoList();
      return todoData;
    } catch (error) {
      print("حدث خطأ أثناء استرداد البيانات: $error");
      return null;
    }
  }

  void _performSearch(String keyword) async {
    if (keyword.isNotEmpty) {
      final results = await SupabaseService(Supabase.instance.client)
          .searchTodoList(keyword);
      setState(() {
        searchResults = results;
      });
    } else {
      setState(() {
        searchResults = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEFF5),
        actions: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg'),
              ),
              kHSpace8,
            ],
          )
        ],
        leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.menu,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          SearchWidget(
            onSearch: _performSearch,
          ),
          kVSpace32,
          BoldTextWidget(
            textIn: "All To DOOOOO",
            textSize: 25,
          ),
          kVSpace32,
          Expanded(
            child: FutureBuilder<List<ToDoModel>?>(
              future: searchResults != null ? null : _todoListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError ||
                    (!snapshot.hasData && searchResults == null)) {
                  return Text("حدث خطأ أثناء جلب البيانات");
                } else {
                  final todoList = searchResults ?? snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      final todo = todoList[index];
                      return ToDoWidget(
                        id: todo.id,
                        created_at: todo.created_at ?? "",
                        TodoText: todo.TodoText ?? "",
                        isItdone: todo.isItdone ?? false,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          AddToDoScreen().push(context);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
