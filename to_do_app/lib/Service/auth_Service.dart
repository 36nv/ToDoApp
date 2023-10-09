import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/Model/to_do_model.dart';

class SupabaseService {
  final SupabaseClient client;
  SupabaseService(this.client);

  Future deleteTodoText(String id) async {
    final supabase = Supabase.instance.client;
    await supabase.from('Todo').delete().eq('id', id);
  }

  Future<List<ToDoModel>?> getTodoList() async {
    final supabase = Supabase.instance.client;
    final rawTodoData = await supabase.from('Todo').select().execute();
    final List<ToDoModel> todoList = [];
    for (final todo in rawTodoData.data as List) {
      todoList.add(ToDoModel.fromJson(todo));
    }
    return todoList;
  }

  Future<void> updateTodoText(int id, bool isDone) async {
    final response = await Supabase.instance.client
        .from('Todo') // Replace with your table name
        .update({'isItdone': isDone}) // Update the task's status
        .eq('id', id) // Select the task by ID
        .execute();
  }

  Future<void> insertTodoText(String todoText) async {
    final response = await Supabase.instance.client
        .from('Todo')
        .insert({'TodoText': todoText}).execute();
  }

  Future<List<ToDoModel>?> searchTodoList(String keyword) async {
    final supabase = Supabase.instance.client;
    final rawTodoData = await supabase
        .from('Todo')
        .select()
        .ilike(
            'TodoText', '%$keyword%') // يبحث باستخدام الكلمة المفتاحية في النص
        .execute();
    final List<ToDoModel> todoList = [];
    for (final todo in rawTodoData.data as List) {
      todoList.add(ToDoModel.fromJson(todo));
    }
    return todoList;
  }
}
