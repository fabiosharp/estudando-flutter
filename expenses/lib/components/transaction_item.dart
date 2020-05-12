import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  
  final Transaction tr;
  final MediaQueryData mediaQuery;
  final void Function(String) onRemove;

  const TransactionItem({
    Key key,
    @required this.tr,
    @required this.mediaQuery,
    @required this.onRemove,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  static const colors = [
    Colors.amber,
    Colors.blueAccent,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.lime,
    Colors.teal,
  ];
  Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {

    
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${widget.tr.value}'),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: widget.mediaQuery.size.width > 400
            ? FlatButton.icon(
                onPressed: () => this.widget.onRemove(widget.tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => this.widget.onRemove(widget.tr.id),
              ),
      ),
    );
  }
}
