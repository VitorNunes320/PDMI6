import 'package:flutter/material.dart';
import 'package:pdmi6/widgets/pet_provider.dart';
import 'package:provider/provider.dart';
import '../routes.dart';
import '../models/pet_model.dart';

class MyPetsPage extends StatefulWidget {
  @override
  _MyPetsPageState createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {
  var items;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    items = Provider.of<PetProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Pets',
          style: TextStyle(
            fontFamily: 'Proxima Nova Bold',
            fontSize: 32,
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 16),
            child: Consumer<PetProvider>(
              builder: (context, cache, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: cache.list.length,
                  itemBuilder: (context, index) {
                    final item = cache.list[index];
                    return Dismissible(
                      key: Key(item.name),
                      onDismissed: (direction) {},
                      background: Container(color: Colors.red),
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: ListTile(
                            leading: Image.asset(cache.list[index].image),
                            title: Text(
                              cache.list[index].race,
                              style: const TextStyle(
                                fontFamily: 'Proxima Nova',
                                fontSize: 12,
                              ),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cache.list[index].name,
                                  style: const TextStyle(
                                    fontFamily: 'Proxima Nova Bold',
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "${cache.list[index].years} years old",
                                  style: const TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              cache.index = index;
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    counter++;
    return Dismissible(
      key: Key(counter.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        items.deleteItem(index);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(items[index].name),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
