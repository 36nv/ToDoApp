import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/Service/auth_Service.dart';
import 'package:to_do_app/Widgets/text_widget.dart';
import 'package:to_do_app/constants/spacings.dart';
import 'package:to_do_app/extensions/screen_size.dart';

final supabaseService = SupabaseService(Supabase.instance.client);

class ToDoWidget extends StatefulWidget {
  const ToDoWidget({
    Key? key,
    required this.TodoText,
    required this.isItdone,
    this.id,
    this.created_at,
  }) : super(key: key);

  final int? id;
  final String? created_at;
  final String TodoText;
  final bool isItdone;

  @override
  _ToDoWidgetState createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  bool isDeleted = false;
  bool isIconVisible = false;

  @override
  void initState() {
    super.initState();
    isIconVisible = widget.isItdone;
  }

  @override
  Widget build(BuildContext context) {
    return isDeleted
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  width: context.getWidth(),
                  height: context.getHeight() / 13,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isIconVisible = !isIconVisible;
                              });

                              if (widget.id != null) {
                                supabaseService.updateTodoText(
                                    widget.id!, isIconVisible);
                              }
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.purple),
                              ),
                              child: isIconVisible ? Icon(Icons.check) : null,
                            ),
                          ),
                          TextWidget(
                            textin: widget.TodoText,
                            textSize: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isDeleted = true;
                              });

                              supabaseService
                                  .deleteTodoText(widget.id.toString());
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                kVSpace16
              ],
            ),
          );
  }
}
