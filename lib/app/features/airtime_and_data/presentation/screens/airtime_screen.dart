import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:d_crypto_lite/app/features/airtime_and_data/data/models/network_provider.dart';
import 'package:d_crypto_lite/app/core/widgets/advance_button.dart';
import 'package:flutter/material.dart';

final List<NetworkProvider> _networkProviders = [
  NetworkProvider(name: "Airtel Airtime VTU", imagePath: "assets/network providers/airtel.jpeg"),
  NetworkProvider(name: "MTN Airtime VTU", imagePath: "assets/network providers/mtn.png"),
  NetworkProvider(name: "GLO Airtime VTU", imagePath: "assets/network providers/glo.png"),
  NetworkProvider(name: "9mobile Airtime VTU", imagePath: "assets/network providers/9mobile.jpeg"),
];

class AirtimeScreen extends StatefulWidget {
  const AirtimeScreen({super.key});

  @override
  State<AirtimeScreen> createState() => _AirtimeScreenState();
}

class _AirtimeScreenState extends State<AirtimeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _saveNumber = true;

  String? _selectedNetwork;

  NetworkProvider? get _selectedProvider =>
      _networkProviders
              .firstWhere(
                (p) => p.name == _selectedNetwork,
                orElse: () => NetworkProvider(name: '', imagePath: ''),
              )
              .name
              .isEmpty
          ? null
          : _networkProviders.firstWhere(
            (p) => p.name == _selectedNetwork,
            orElse: () => NetworkProvider(name: '', imagePath: ''),
          );

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
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                        border: Border.all(color: AppColors.primaryColor, width: 1),
                        color: Colors.grey[200],
                      ),
                      child:
                          _selectedProvider != null
                              ? ClipRRect(
                                borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                                child: Image.asset(
                                  _selectedProvider!.imagePath,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                              : const SizedBox.shrink(),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: AppColors.backgroundColor,
                          isExpanded: true,
                          value: _selectedNetwork,
                          hint: Text(
                            "Select Network Provider",
                            style: t.bodyMedium?.copyWith(color: AppColors.secondaryColor),
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: AppColors.secondaryColor,
                          ),
                          items:
                              _networkProviders
                                  .map(
                                    (provider) => DropdownMenuItem(
                                      value: provider.name,
                                      child: Text(provider.name, style: t.bodyMedium),
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
      ),
    );
  }
}

class _InputField extends StatefulWidget {
  const _InputField({required this.hintText, required this.maxLength});

  final String hintText;
  final int maxLength;

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  final TextEditingController _controller = TextEditingController();

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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
        counterText: "${_controller.text.length}/${widget.maxLength}",
        counterStyle: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: AppColors.secondaryColor),
      ),
      maxLength: widget.maxLength,
      keyboardType: TextInputType.number,
      onChanged: (_) => setState(() {}),
    );
  }
}
