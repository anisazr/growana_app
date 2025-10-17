import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
static final List<String> _shoppingList = [];

  void _addItem() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Tambah Item Belanja"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Masukkan nama item",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D7140),
            ),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                setState(() {
                  _shoppingList.add(controller.text.trim());
                });
                Navigator.pop(context);
              }
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  void _deleteItem(int index) {
    setState(() {
      _shoppingList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Belanja"),
        backgroundColor: const Color(0xFF1D7140),
      ),
      body: _shoppingList.isEmpty
          ? const Center(child: Text("Belum ada item belanja."))
          : ListView.builder(
              itemCount: _shoppingList.length,
              itemBuilder: (context, index) => Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.shopping_bag_outlined,
                      color: Color(0xFF1D7140)),
                  title: Text(_shoppingList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteItem(index),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1D7140),
        icon: const Icon(Icons.add),
        label: const Text("Tambah Item"),
        onPressed: _addItem,
      ),
    );
  }
}
