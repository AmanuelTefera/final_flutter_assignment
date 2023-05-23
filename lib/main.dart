import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/items_provider.dart';
import 'providers/Item_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Items(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ItemListScreen(),
      ),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 19.0,
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.data_object),
              onPressed: () {},
            ),
            SizedBox(width: 30),
            Container(
              child: Text("List of items"),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('images/IMG_20221017_014454_443.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Center(
                    child: Text(
                      'Amanuel Tefera',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'amanueltefera11@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.data_object),
              title: Text("Item"),
              iconColor: Colors.black,
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              iconColor: Colors.black,
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              iconColor: Colors.black,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  items[index].imageUrl,
                ),
              ),
            ),
            title: Text(items[index].name),
            subtitle: Text('Price: \$${items[index].price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailScreen(item: items[index]),
                ),
              );
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          );
        },
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  ItemDetailScreen({required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(item.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
