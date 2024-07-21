import 'package:app/component/custom_input_decoration.dart';
import 'package:app/modules/pinjaman/model/pinjaman.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormPart extends StatelessWidget {
    const FormPart({
        super.key,
        required this.isLoading,
        required this.model,
        required this.formKey,
    });

    final bool isLoading;
    final Pinjaman model;
    final GlobalKey<FormBuilderState> formKey;

    @override
    Widget build(BuildContext context) {
        return FormBuilder(
            key: formKey,
            child: Column(children: [
                FormBuilderTextField(
                    name: 'pinjaman_id',
                    initialValue: model.pinjamanId,
                    decoration: CustomInputDecoration().floating('pinjaman_id'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'pinjaman_code',
                    initialValue: model.pinjamanCode,
                    decoration: CustomInputDecoration().floating('pinjaman_code'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'pinjaman_date',
                    initialValue: model.pinjamanDate,
                    decoration: CustomInputDecoration().floating('pinjaman_date'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'pinjaman_tipe',
                    initialValue: model.pinjamanTipe,
                    decoration: CustomInputDecoration().floating('pinjaman_tipe'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'pinjaman_jk',
                    initialValue: model.pinjamanJk,
                    decoration: CustomInputDecoration().floating('pinjaman_jk'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'pinjaman_total',
                    initialValue: model.pinjamanTotal,
                    decoration: CustomInputDecoration().floating('pinjaman_total'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'pinjaman_status',
                    initialValue: model.pinjamanStatus,
                    decoration: CustomInputDecoration().floating('pinjaman_status'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'status',
                    initialValue: model.status,
                    decoration: CustomInputDecoration().floating('status'),
                ),
                const SizedBox(height: 16),
            ]),
        );
    }
}
