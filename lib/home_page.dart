import 'package:flutter/material.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class HomePageTWO extends StatefulWidget {
  @override
  _HomePageTWOState createState() => _HomePageTWOState();
}

class _HomePageTWOState extends State<HomePageTWO> {
  final TextEditingController _controller = TextEditingController();
  List list = [];
  List list2 = [];
  List sortedList = [];
  List<int> integerList = [];
  List merged = [];
  bool buildLIst = false;
  List finalList = [];
  var listLenght;
//_controller.text.split(',').toString()
  ontapped() async {
    list.clear();
    list.add(_controller.text.split(','));

    for (var i = 0; i <= (list[0].length - 1); i++) {
      integerList.add(int.parse(list[0][i].toString()));
      print(integerList);
    }

    integerList.sort();
    print(integerList);
    modifyList(list: integerList);
  }

  modifyList({List? list}) async {
    var list1 = list;
    print(list!.length);
    for (var i = 0; i <= (list.length) - 1; i++) {
      if (list[i] != list.last) {
        if (list[i] + 1 != list[i + 1]) {
          // list.add(list[i] + 1);
          list2.add(list[i] + 1);
          print('list 2');
          print(list2);
        }
      } else {}
    }
    merged = list2 + integerList;
    print(merged);
    merged.sort();
    // print(list2);
    setState(() {
      buildLIst = true;
    });
  }

//cnalsoinsertvalueinbetweenlistindex
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                onChanged: (v) {},
              ),
              ElevatedButton(
                onPressed: ontapped,
                child: Text('Press me'),
              ),
              buildLIst == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Number you inputted'),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: integerList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(integerList[index].toString()),
                            );
                          },
                        ),
                        Text('Numers which were not in the list'),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: list2.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(list2[index].toString()),
                            );
                          },
                        ),
                        Text('Cosecutive numbers'),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: merged.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(merged[index].toString()),
                            );
                          },
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
