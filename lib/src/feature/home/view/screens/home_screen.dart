import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:currency_app/src/core/constants/context_extension.dart';
import 'package:currency_app/src/core/widget/app_material_context.dart';
import 'package:currency_app/src/core/widget/currency_util.dart';
import 'package:currency_app/src/feature/home/cubit/home_cubit.dart';
import 'package:currency_app/src/feature/home/view/widgets/custom_background.dart';
import 'package:currency_app/src/feature/home/view/widgets/custom_currency_card.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver{
  final _fromTextController = TextEditingController();
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  bool _isBottomSheetVisible = false;
  Timer? _timer;
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    cubit = context.read<HomeCubit>()..loadLastCurrencyData();

    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        showInternetBottomSheet(false);
      } else {
        showInternetBottomSheet(true);

        if (_fromTextController.text.isNotEmpty) {
          cubit.updateAmount(_fromTextController.text);
        }
      }
    });

    _fromTextController.addListener(() {
      EasyDebounce.debounce(
        "fromTextDebouncer",
        const Duration(milliseconds: 700),
        () {
          log("fromTextDebouncer");
          if (_fromTextController.text.isNotEmpty) {
            cubit.updateAmount(_fromTextController.text);
          }
        },
      );
    });
  }

  @override
  void dispose() async{
    WidgetsBinding.instance.removeObserver(this);
    _fromTextController.dispose();
    _subscription.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused||state == AppLifecycleState.detached) {
      _saveCurrencyData();
    }
    super.didChangeAppLifecycleState(state);
  }

  Future<void> _saveCurrencyData() async {
    await cubit.writeCurrencyData(
      fromCurrency: cubit.state.fromCurrency,
      toCurrency: cubit.state.toCurrency,
      fromAmount: cubit.state.fromAmount,
      toAmount: cubit.state.toAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    log("BUILD");
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (_fromTextController.text != state.fromAmount) {
            _fromTextController.text = state.fromAmount;
          }
          return SingleChildScrollView(
            child: Stack(
              children: [
                const CustomBackground(),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(height: context.mediaQuery.size.height * 0.1),
                      CustomCurrencyCard(
                        textEditingController: _fromTextController,
                        flagEmoji: CurrencyUtil.currencyToEmoji(state.fromCurrency.code.substring(0,2)),
                        currency: state.fromCurrency,
                        onTap: () => _buildMenuCurrency(true),
                        keyboardType: TextInputType.number,
                      ),
                      20.verticalSpace,
                      MaterialButton(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        disabledColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () => context.read<HomeCubit>().switchCurrencies(),
                        child: Image.asset(
                          "assets/icons/switch_icon.png",
                          height: 40,
                          width: 60,
                          fit: BoxFit.fill,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                      20.verticalSpace,
                      CustomCurrencyCard(
                        textEditingController: TextEditingController(text: state.toAmount),
                        flagEmoji: CurrencyUtil.currencyToEmoji(state.toCurrency.code.substring(0,2)),
                        onTap: () => _buildMenuCurrency(false),
                        keyboardType: TextInputType.none,
                        enabled: false,
                        currency: state.toCurrency,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: context.mediaQuery.viewInsets.bottom > 0
          ? null
          : FloatingActionButton(
              onPressed: () async{
                themeController.switchTheme();
                // await NotificationServer.showNotification("title", "body");
                // await Workmanager().cancelAll();
              },
              mini: true,
              child: Icon(
                themeController.isLight ? Icons.dark_mode : Icons.light_mode,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
    );
  }

  void _buildMenuCurrency(bool isFromCurrency) {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showSearchField: true,
      onSelect: (Currency currency) {
        if (isFromCurrency) {
          cubit.changeFromCurrency(currency);
        } else {
          cubit.changeToCurrency(currency);
        }
      },
    );
  }

  void showInternetBottomSheet([bool internet = false]) {
    if (_isBottomSheetVisible) {
      Navigator.pop(context);
      _timer?.cancel();
    }
    _isBottomSheetVisible = true;
    showModalBottomSheet(
        backgroundColor: internet ? Colors.green : Colors.redAccent,
        context: context,
        isDismissible: false,
        builder: (context) {
          return SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(internet ? Icons.check : Icons.not_interested_sharp),
                const SizedBox(width: 8),
                Text(internet ? "Internet connected" : "No Internet Connection"),
              ],
            ),
          );
        });

    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted&&_isBottomSheetVisible) {
        Navigator.pop(context);
        _isBottomSheetVisible = false;
      }
    });
  }
}