import 'package:currency/src/features/converting/domain/entity/currency.dart';
import 'package:currency/src/features/converting/presentation/currency_modal_bottom_sheet.dart';
import 'package:currency/src/features/converting/presentation/vm/currencies_vm.dart';
import 'package:currency/src/shared/app_card.dart';
import 'package:currency/src/shared/app_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SecondCard extends StatefulWidget {
  const SecondCard({super.key});

  @override
  State<SecondCard> createState() => _FirstCardState();
}

class _FirstCardState extends State<SecondCard> {
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
            selector: (_, vm) => vm.secondCurrencyCode,
            builder: (context, value, _) => Text(value),
          ),
          onTap: () async {
            final vm = context.read<CurrenciesVm>()..fetchCurrencies();
            final currency = await _showBottomSheet();
            vm.setSecondCurrencyCode(currency.code);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Selector<CurrenciesVm, double>(
              selector: (_, vm) => vm.secondValue,
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
                    vm.secondValue = double.parse(value);
                  },
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
