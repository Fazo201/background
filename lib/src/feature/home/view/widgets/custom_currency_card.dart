import 'package:currency_app/src/data/entity/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCurrencyCard extends StatelessWidget {
  const CustomCurrencyCard({
    super.key,
    this.textEditingController,
    this.onTap,
    required this.flagEmoji,
    this.onChanged,
    required this.keyboardType,
    this.enabled,
    required this.currency,
  });

  final TextEditingController? textEditingController;
  final String flagEmoji;
  final CurrencyModel currency;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType keyboardType;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      child: SizedBox(
        height: 170.h,
        width: double.infinity,
        child: Padding(
          padding: REdgeInsets.all(16.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: onTap,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Text(
                    flagEmoji,
                    style: TextStyle(fontSize: 32.sp),
                  ),
                  title: Text(currency.name,style:const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(currency.code,style: TextStyle(fontSize: 12.sp),),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
              TextField(
                enabled: enabled,
                controller: textEditingController,
                decoration: InputDecoration(
                  suffix: Text(currency.symbol),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
