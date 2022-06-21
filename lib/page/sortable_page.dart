import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datatable_sortable_example/data/users.dart';
import 'package:datatable_sortable_example/model/user.dart';
import 'package:datatable_sortable_example/widget/scrollable_widget.dart';
import 'package:flutter/material.dart';

class SortablePage extends StatefulWidget {
  @override
  _SortablePageState createState() => _SortablePageState();
}

var date2 = DateTime.now();
Color colorRowNotOk = Colors.white;
Color colorRowOk = Colors.white;

class _SortablePageState extends State<SortablePage> {
  late List<User> users;
  //List<Object> users = [];
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
    //validateDate();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = [
      'Nome',
      'Email',
      'Fone',
      'Tipo',
      'Mensagem',
      'Código',
      'Corretor',
      'Ult. Cont'
    ];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
      //validateDate(),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [
          user.nome,
          user.email,
          user.fone,
          user.tipo,
          user.mensagem,
          user.cod,
          user.corretor,
          user.ultCont
        ];

        return DataRow(
            color: MaterialStateColor.resolveWith(
              (states) {
                var difference = date2.difference(user.ultCont).inHours;
                if (difference >= 8) {
                  colorRowNotOk = Colors.red;
                  return colorRowNotOk;
                } else {
                  colorRowOk = Colors.white;
                  return colorRowOk;
                }
              },
            ),
            cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort(
          (user1, user2) => compareString(ascending, user1.nome, user2.nome));
    } else if (columnIndex == 1) {
      users.sort(
          (user1, user2) => compareString(ascending, user1.email, user2.email));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.fone}', '${user2.fone}'));
    } else if (columnIndex == 3) {
      users.sort(
          (user1, user2) => compareString(ascending, user1.tipo, user2.tipo));
    } else if (columnIndex == 3) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.mensagem, user2.mensagem));
    } else if (columnIndex == 4) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.cod}', '${user2.cod}'));
    } else if (columnIndex == 5) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.corretor, user2.corretor));
    } else if (columnIndex == 6) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.ultCont}', '${user2.ultCont}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  Future getUsersList() async {
    final data =
        await FirebaseFirestore.instance.collection('Contatos').doc('2');
    setState(() {});
  }
}
