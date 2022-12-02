import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/bottom_sheet_helper.dart';
import '../../../core/helper/converter_helper.dart';
import '../../../core/helper/date_time_helper.dart';
import '../../../core/helper/dialog_helper.dart';
import '../../../core/helper/extension/int_extension.dart';
import '../../../core/helper/input_formater.dart';
import '../../../core/helper/validator_helper.dart';
import '../../../core/localization/language_const.dart';
import '../../../core/localization/locale_helper.dart';
import '../../../core/modules/module_helper.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/theme_manager.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_form_field.dart';
import '../../widgets/common_widget.dart';
import '../../widgets/date_picker_widget.dart';

class UtilsView extends StatefulWidget {
  const UtilsView({Key? key}) : super(key: key);

  @override
  State<UtilsView> createState() => _UtilsViewState();
}

class _UtilsViewState extends State<UtilsView> {
  File? _imageFile;
  final currencyCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const int currency = 125000;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ContentWrapper(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Is Dark Mode'),
                    GetX<ThemeManager>(
                      builder: (controller) => Switch(
                        value: controller.isDark.value,
                        onChanged: (value) {
                          controller.changeTheme();
                        },
                      ),
                    ),
                  ],
                ),
                Text('Sample Currency Format = ${currency.currencyFormat()}'),
                const SizedBox(height: 12),
                BaseButton(
                  onPressed: () => LocaleHelper().showLocaleDialog(context),
                  text: International.changeLanguage.tr,
                  icon: CupertinoIcons.paintbrush,
                ),
                BaseButton(
                  onPressed: () {
                    AppDialog.show(
                      typeDialog: TypeDialog.WARNING,
                      message: 'Dialog',
                      onPress: () => AppDialog.close(),
                    );
                  },
                  text: 'Dialog',
                  icon: CupertinoIcons.conversation_bubble,
                ),
                BaseButton(
                  onPressed: () {
                    Loading.show(dismissible: true);
                  },
                  text: 'Loading',
                  icon: CupertinoIcons.refresh_thick,
                ),
                BaseButton(
                  onPressed: () {
                    final String? converted = DateTimeHelper(
                            startDate: DateTime.now(), endDate: DateTime.now())
                        .format();
                    Toast.show('Date converted :\n $converted');
                  },
                  text: '${International.convert.tr} ${International.date.tr}',
                ),
                BaseButton(
                  onPressed: () {
                    BottomSheetHelper.basic(
                      child: DatePickerWidget.range(
                        onSelectionChanged: (selected) {},
                      ),
                    );
                  },
                  text: 'Bottom Sheet + Date Range',
                  icon: Icons.date_range_outlined,
                ),
                BaseButton(
                  onPressed: () {
                    final String converted = AppConverter.replaceStringRange(
                        'name@email.com', 2, 5, '*');
                    debugPrint('Converted = $converted');
                    Toast.show('String converted :\n $converted');
                  },
                  text: '${International.convert.tr} String',
                  icon: CupertinoIcons.t_bubble,
                ),
                const SizedBox(height: 12),
                BaseFormField(
                  controller: currencyCtr,
                  initialValue: 0.toStringIDR(),
                  label: International.price.tr,
                  hint: International.price.tr,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => (value.isEmpty)
                      ? currencyCtr.text = 0.toStringIDR()
                      : value,
                  validator: (value) => AppValidator.generalField('$value'),
                  inputFormatters: CustomInputFormatters.idrCurrency,
                  onFieldSubmitted: (value) => Toast.show(value),
                ),
                const SizedBox(height: 20),
                ..._buildImagePicker(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<StatelessWidget> _buildImagePicker(BuildContext context) => [
        const Text('Module Camera'),
        Container(
          child: _imageFile != null
              ? Image.file(
                  _imageFile!,
                  height: MediaQuery.of(context).size.width * 1 / 2,
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  fit: BoxFit.contain,
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.width * 1 / 2,
                  width: MediaQuery.of(context).size.width * 1 / 2,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(40),
                      child: Image(
                        image: AssetImage('assets/images/img_man.png'),
                      ),
                    ),
                  ),
                ),
        ),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              ModuleHelper.pickImage(showInfo: true).then((img) {
                if (img != null) {
                  setState(() => _imageFile = img);
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 100,
              child: Column(
                children: [
                  const Icon(
                    Icons.add_a_photo_outlined,
                    size: 30,
                    color: AppColors.primary,
                  ),
                  Text(International.camera.tr)
                ],
              ),
            ),
          ),
        )
      ];
}
