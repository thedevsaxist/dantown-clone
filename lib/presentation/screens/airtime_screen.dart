import 'package:d_crypto_lite/core/theme.dart';
import 'package:d_crypto_lite/presentation/widgets/advance_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class AirtimeScreen extends StatefulWidget {
  const AirtimeScreen({super.key});

  @override
  State<AirtimeScreen> createState() => _AirtimeScreenState();
}

class _AirtimeScreenState extends State<AirtimeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _saveNumber = true;

  String? _selectedNetwork;

  final List<String> _networkProviders = [
    "Airtel Airtime VTU",
    "MTN Airtime VTU",
    "GLO Airtime VTU",
    "9mobile Airtime VTU",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Airtime & Data"),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelStyle: t.bodyMedium?.copyWith(color: AppColors.primaryColor),
          unselectedLabelColor: AppColors.secondaryColor,
          indicatorColor: AppColors.primaryColor,
          dividerColor: AppColors.backgroundColor,
          tabs: [Tab(text: "Buy airtime"), Tab(text: "Buy data")],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(
              "Select Network Provider",
              style: t.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                      border: Border.all(color: AppColors.primaryColor, width: 1),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedNetwork,
                        hint: Text(
                          "Select Network Provider",
                          style: t.bodyMedium?.copyWith(color: AppColors.secondaryColor),
                        ),
                        icon: Icon(Icons.arrow_drop_down_rounded, color: AppColors.secondaryColor),
                        items:
                            _networkProviders
                                .map(
                                  (provider) => DropdownMenuItem(
                                    value: provider,
                                    child: Text(provider, style: t.bodyMedium),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedNetwork = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Choose beneficiary action
                },
                child: Text(
                  "Choose Beneficiary",
                  style: t.bodyMedium?.copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 8),
            _InputField(hintText: "09000123733", maxLength: 11),
            Row(
              children: [
                Checkbox(
                  value: _saveNumber,
                  onChanged: (v) {
                    setState(() {
                      _saveNumber = v ?? false;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _saveNumber = !_saveNumber;
                    });
                  },
                  child: Text(
                    "Save number",
                    style: t.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("Amount", style: t.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),

            _InputField(hintText: "Enter Amount", maxLength: 5),

            const SizedBox(height: 24),

            AdvanceButton(label: "Continue to pay", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatefulWidget {
  const _InputField({super.key, required this.hintText, required this.maxLength});

  final String hintText;
  final int maxLength;

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  final TextEditingController _controller = TextEditingController();
  // static const int _maxLength = 5;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: t.bodyMedium?.copyWith(color: AppColors.secondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
        counterText: "${_controller.text.length}/${widget.maxLength}",
      ),
      maxLength: widget.maxLength,
      keyboardType: TextInputType.number,
      onChanged: (_) => setState(() {}),
    );
  }
}
