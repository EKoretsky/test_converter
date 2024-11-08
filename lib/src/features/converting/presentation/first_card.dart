import 'package:currency/src/features/converting/domain/entity/currency.dart';
import 'package:currency/src/features/converting/presentation/currency_modal_bottom_sheet.dart';
import 'package:currency/src/features/converting/presentation/vm/currencies_vm.dart';
import 'package:currency/src/shared/app_card.dart';
import 'package:currency/src/shared/app_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FirstCard extends StatefulWidget {
  const FirstCard({super.key});

  @override
  State<FirstCard> createState() => _FirstCardState();
}

class _FirstCardState extends State<FirstCard> {
  final _textController = TextEditingController();

  Future<Currency> _showBottomSheet() async {
    return await showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) => const CurrencyModalBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      children: [
        AppListTile(
          title: Selector<CurrenciesVm, String>(
            selector: (_, vm) => vm.firstCurrencyCode,
            builder: (context, value, _) => Text(value),
          ),
          onTap: () async {
            final vm = context.read<CurrenciesVm>()..fetchCurrencies();
            final currency = await _showBottomSheet();
            vm.setFirstCurrencyCode(currency.code);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Selector<CurrenciesVm, double>(
              selector: (_, vm) => vm.firstValue,
              builder: (context, val, _) {
                _textController.text = val.toString();
                return TextField(
                  controller: _textController,
                  onSubmitted: (value) async {
                    final vm = context.read<CurrenciesVm>();
                    await vm.convert(
                      base: context.read<CurrenciesVm>().firstCurrencyCode,
                      to: context.read<CurrenciesVm>().secondCurrencyCode,
                    );
                    vm.firstValue = double.parse(value);
                  },
                  // onChanged: (value) async {
                  //   final vm = context.read<CurrenciesVm>();
                  //   vm.firstValue = double.parse(value);
                  //   await vm.convert(
                  //     base: context.read<CurrenciesVm>().firstCurrencyCode,
                  //     to: context.read<CurrenciesVm>().secondCurrencyCode,
                  //   );
                  // },
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
