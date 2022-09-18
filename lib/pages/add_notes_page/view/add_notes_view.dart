import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_case/core/constant/text_constant.dart';
import 'package:mars_case/pages/add_notes_page/viewmodel/add_notes_viewmodel.dart';
import 'package:mars_case/service/model/user_model.dart';

import '../../../core/helper/loading_manager/loading_manager.dart';
import '../../../core/helper/statefull_wrapper.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_textfield.dart';

class AddNotesView extends StatelessWidget {
  AddNotesView({Key? key, this.note, this.index}) : super(key: key);
  final Notes? note;
  final int? index;
  final _viewModel = AddNotesViewModel();

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        _viewModel.fillFields(note);
        _viewModel.setContext(context);
      },
      child: Scaffold(
        appBar:
            CustomAppBar(title: note == null ? Constants.get.textConstant.addNote : Constants.get.textConstant.update),
        body: Center(
          child: SingleChildScrollView(
            child: _containerMethod(context),
          ),
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
        _textfieldMethod(Constants.get.textConstant.enterTitle, _viewModel.titleController, 50, 200),
        SizedBox(height: context.dynamicHeight(0.05)),
        _textfieldMethod(Constants.get.textConstant.decription, _viewModel.descriptionController,
            context.dynamicHeight(0.35), context.dynamicHeight(.8)),
        SizedBox(height: context.dynamicHeight(0.05)),
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
          maxLines: 20,
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
        text: note == null ? Constants.get.textConstant.save : Constants.get.textConstant.update,
        height: context.dynamicHeight(0.05),
        width: context.dynamicWidth(0.7),
        onTap: () async {
          await LoadingManager.instance.showLoading(context);
          note == null ? await _viewModel.add() : await _viewModel.update(index);
          await LoadingManager.instance.hideLoading(context);
        },
        mainAxisAlignment: MainAxisAlignment.center);
  }
}
