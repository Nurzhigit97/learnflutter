import 'package:flutter/material.dart';
import 'package:learnflutter/futures/service_user.dart';

class Futuress extends StatefulWidget {
  const Futuress({super.key});

  @override
  State<Futuress> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Futuress> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 500,
      child: FutureBuilder(
        future: Services.loadData(),
        builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
            snapshot.hasData
                ? ListView.builder(
                    // render the list
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) => Card(
                      margin: const EdgeInsets.all(10),
                      // render list item
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        title: Text(snapshot.data![index]['title']),
                        subtitle: Text(snapshot.data![index]['body']),
                      ),
                    ),
                  )
                : const Center(
                    // render the loading indicator
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
