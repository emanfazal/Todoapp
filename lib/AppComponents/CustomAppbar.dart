import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/utils.dart';
import 'package:provider/provider.dart';
import '../generated/assets.dart';
import '../Providers/TodoProvider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false; // Toggle for search bar visibility

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        children: [
          Image.asset(Assets.imagesTodolist1,height: 40,), // List Icon
          const SizedBox(width: 30),

          // If search is activated, show search field
          if (_isSearching)
            Expanded(
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search tasks...',
                  border: InputBorder.none,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                onChanged: (value) {
                  // Trigger search functionality
                  Provider.of<TodoProvider>(context, listen: false)
                      .searchTodos(value);
                },
              ),
            )
          else
          // Default App Bar title
            Text(
              AppText.Todolist,
              style: TextStyles.Tasktextheight15(context),
            ),

          const Spacer(),

          // Display filter or clear icon based on search mode
          if (_isSearching)
            IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchController.clear();
                  Provider.of<TodoProvider>(context, listen: false)
                      .searchTodos(''); // Clear search
                });
              },
              icon: const Icon(Icons.clear,color: AppColors.primaryColor,),
            )
          else
            IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
              icon:Image.asset(Assets.imagesFilterIcon),
            ),
        ],
      ),
    );
  }
}
