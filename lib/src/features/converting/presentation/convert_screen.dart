import 'package:currency/src/features/converting/presentation/first_card.dart';
import 'package:currency/src/features/converting/presentation/second_card.dart';
import 'package:flutter/material.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  // @override
  // void initState() {
  //   _firstController.addListener(() {
  //     _secondController.text = context.read<ConvertRateVm>().secondValue;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency convert'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FirstCard(),
            // AppCard(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       AppListTile(
            //         title: ValueListenableBuilder(
            //           valueListenable: firstCurrencyNotifier,
            //           builder: (context, value, _) => Text(value),
            //         ),
            //         onTap: () async {
            //           final currenciesVm = context.read<CurrenciesVm>();
            //           await currenciesVm.fetchCurrencies();
            //           final currency = await _showBottomSheet();
            //           firstCurrencyNotifier.value = currency.code;
            //         },
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //         child: StatefulBuilder(builder: (context, setState) {
            //           return TextField(
            //             controller: _firstController,
            //             onChanged: (value) async {
            //               context.read<ConvertRateVm>().setFirstVal(value);
            //               final vm = context.read<ConvertRateVm>();
            //               final rate = await vm.convert(
            //                 base: firstCurrencyNotifier.value,
            //                 to: secondCurrencyNotifier.value,
            //               );
            //               _secondController.text =
            //                   (rate.value * double.parse(_firstController.text))
            //                       .toString();
            //             },
            //             keyboardType: TextInputType.number,
            //           );
            //         }),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.swap_vert),
              iconSize: 30,
              onPressed: () async {
                // final vm = context.read<ConvertRateVm>();
                // await vm.convert(baseCurrency: firstCurrencyNotifier.value);
              },
            ),
            const SizedBox(height: 20),
            const SecondCard(),
            // AppCard(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       AppListTile(
            //         title: ValueListenableBuilder(
            //           valueListenable: secondCurrencyNotifier,
            //           builder: (context, value, _) {
            //             return Text(value);
            //           },
            //         ),
            //         onTap: () async {
            //           final currenciesVm = context.read<CurrenciesVm>();
            //           await currenciesVm.fetchCurrencies();
            //           final currency = await _showBottomSheet();
            //           secondCurrencyNotifier.value = currency.code;
            //         },
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //         child: TextField(
            //           controller: _secondController,
            //           onChanged: (value) {
            //             context.read<ConvertRateVm>().setFirstVal(value);
            //           },
            //           keyboardType: TextInputType.number,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
