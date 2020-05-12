import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (bcontext, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(height: constraints.maxHeight * .05),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: constraints.maxHeight * .05),
                  Container(
                    height: constraints.maxHeight * .6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions.map((tr) {
              return TransactionItem(
                key: ValueKey(tr.id),
                tr: tr,
                mediaQuery: mediaQuery,
                onRemove: onRemove,
              );
            }).toList());
/*         : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(tr: tr, mediaQuery: mediaQuery, onRemove: onRemove);
            },
          ); */
  }
}
