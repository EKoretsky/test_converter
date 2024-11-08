import 'package:currency/src/features/converting/presentation/vm/currencies_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyModalBottomSheet extends StatelessWidget {
  const CurrencyModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrenciesVm>(
      builder: (context, vm, _) {
        if (vm.isLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: vm.currencies.length,
            itemBuilder: (context, index) {
              final currency = vm.currencies[index];
              return ListTile(
                leading: Text(currency.code),
                title: Text(currency.name),
                trailing: const Icon(CupertinoIcons.chevron_forward),
                onTap: () {
                  Navigator.pop(context, currency);
                },
              );
            },
          ),
        );
      },
    );
  }
}
