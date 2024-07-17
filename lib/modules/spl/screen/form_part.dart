import 'package:app/component/custom_input_decoration.dart';
import 'package:app/modules/spl/model/spl.dart';
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
    final Spl model;
    final GlobalKey<FormBuilderState> formKey;

    @override
    Widget build(BuildContext context) {
        return FormBuilder(
            key: formKey,
            child: Column(children: [
                FormBuilderTextField(
                    name: 'spl_id',
                    initialValue: model.splId,
                    decoration: CustomInputDecoration().floating('spl_id'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'spl_nomor',
                    initialValue: model.splNomor,
                    decoration: CustomInputDecoration().floating('spl_nomor'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'spl_tanggal',
                    initialValue: model.splTanggal,
                    decoration: CustomInputDecoration().floating('spl_tanggal'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'spl_tgl_spl',
                    initialValue: model.splTglSpl,
                    decoration: CustomInputDecoration().floating('spl_tgl_spl'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'spl_lama',
                    initialValue: model.splLama,
                    decoration: CustomInputDecoration().floating('spl_lama'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'spl_keterangan',
                    initialValue: model.splKeterangan,
                    decoration: CustomInputDecoration().floating('spl_keterangan'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'spl_status',
                    initialValue: model.splStatus,
                    decoration: CustomInputDecoration().floating('spl_status'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'spl_alasan_penolakan',
                    initialValue: model.splAlasanPenolakan,
                    decoration: CustomInputDecoration().floating('spl_alasan_penolakan'),
                ),
                const SizedBox(height: 16),
            ]),
        );
    }
}
