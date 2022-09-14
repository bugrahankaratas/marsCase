import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/pages/edit_notes_page/viewmodel/edit_notes_viewmodel.dart';

import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_textfield.dart';

class EditNotesView extends StatelessWidget {
  EditNotesView({Key? key, required this.index}) : super(key: key);
  final int index;
  final _viewModel = EditNotesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Notes'),
      body: Center(
        child: SingleChildScrollView(
          child: _containerMethod(context),
        ),
      ),
    );
  }

  CustomContainer _containerMethod(BuildContext context) {
    return CustomContainer(
      height: 0.7,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: context.dynamicHeight(.05)),
        _textfieldMethod('Başlık Giriniz', _viewModel.titleController, 50, 200),
        SizedBox(height: context.dynamicHeight(0.05)),
        _textfieldMethod(
            'Açıklama', _viewModel.descriptionController, context.dynamicHeight(0.3), context.dynamicHeight(.7)),
        SizedBox(height: context.dynamicHeight(0.1)),
        _saveButton(context)
      ],
    );
  }

  Container _textfieldMethod(String hintText, TextEditingController controller, double height, double width) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: CustomTextField(
          border: InputBorder.none,
          prefixIcon: const SizedBox(),
          hintText: hintText,
          controller: controller,
        ),
      ),
    );
  }

  CustomElevatedButton _saveButton(BuildContext context) {
    return CustomElevatedButton(
        text: 'Güncelle',
        height: context.dynamicHeight(0.05),
        width: context.dynamicWidth(0.7),
        onTap: () {
          _viewModel.update(index);
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }
}
