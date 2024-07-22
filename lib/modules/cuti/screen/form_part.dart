import 'package:app/component/custom_input_decoration.dart';
import 'package:app/modules/cuti/model/cuti.dart';
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
    final Cuti model;
    final GlobalKey<FormBuilderState> formKey;

    @override
    Widget build(BuildContext context) {
        return FormBuilder(
            key: formKey,
            child: Column(children: [
                FormBuilderTextField(
                    name: 'cuti_id',
                    initialValue: model.cutiId,
                    decoration: CustomInputDecoration().floating('cuti_id'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'cuti_nomor',
                    initialValue: model.cutiNomor,
                    decoration: CustomInputDecoration().floating('cuti_nomor'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'cuti_tanggal',
                    initialValue: model.cutiTanggal,
                    decoration: CustomInputDecoration().floating('cuti_tanggal'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'jenis_absensi_nama',
                    initialValue: model.jenisAbsensiNama,
                    decoration: CustomInputDecoration().floating('jenis_absensi_nama'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'periode',
                    initialValue: model.periode,
                    decoration: CustomInputDecoration().floating('periode'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'cuti_keperluan',
                    initialValue: model.cutiKeperluan,
                    decoration: CustomInputDecoration().floating('cuti_keperluan'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'cuti_status',
                    initialValue: model.cutiStatus,
                    decoration: CustomInputDecoration().floating('cuti_status'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'cuti_alasan_penolakan',
                    initialValue: model.cutiAlasanPenolakan,
                    decoration: CustomInputDecoration().floating('cuti_alasan_penolakan'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'cuti_bukti',
                    initialValue: model.cutiBukti,
                    decoration: CustomInputDecoration().floating('cuti_bukti'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'cuti_file',
                    initialValue: model.cutiFile,
                    decoration: CustomInputDecoration().floating('cuti_file'),
                ),
                const SizedBox(height: 16),
            ]),
        );
    }
}
