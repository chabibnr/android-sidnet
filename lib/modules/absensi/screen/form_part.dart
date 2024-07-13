import 'package:app/component/custom_input_decoration.dart';
import 'package:app/modules/absensi/model/absensi.dart';
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
    final Absensi model;
    final GlobalKey<FormBuilderState> formKey;

    @override
    Widget build(BuildContext context) {
        return FormBuilder(
            key: formKey,
            child: Column(children: [
                FormBuilderTextField(
                    name: 'absensi_id',
                    initialValue: model.absensiId,
                    decoration: CustomInputDecoration().floating('absensi_id'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_tanggal',
                    initialValue: model.absensiTanggal,
                    decoration: CustomInputDecoration().floating('absensi_tanggal'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_hari',
                    initialValue: model.absensiHari,
                    decoration: CustomInputDecoration().floating('absensi_hari'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_in',
                    initialValue: model.absensiIn,
                    decoration: CustomInputDecoration().floating('absensi_in'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_out',
                    initialValue: model.absensiOut,
                    decoration: CustomInputDecoration().floating('absensi_out'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_telat',
                    initialValue: model.absensiTelat,
                    decoration: CustomInputDecoration().floating('absensi_telat'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_plg_cepat',
                    initialValue: model.absensiPlgCepat,
                    decoration: CustomInputDecoration().floating('absensi_plg_cepat'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_jam_lebih',
                    initialValue: model.absensiJamLebih,
                    decoration: CustomInputDecoration().floating('absensi_jam_lebih'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_jam_spl',
                    initialValue: model.absensiJamSpl,
                    decoration: CustomInputDecoration().floating('absensi_jam_spl'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'absensi_no_spl',
                    initialValue: model.absensiNoSpl,
                    decoration: CustomInputDecoration().floating('absensi_no_spl'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'jenis_absensi_nama',
                    initialValue: model.jenisAbsensiNama,
                    decoration: CustomInputDecoration().floating('jenis_absensi_nama'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'keterangan',
                    initialValue: model.keterangan,
                    decoration: CustomInputDecoration().floating('keterangan'),
                ),
                const SizedBox(height: 16),
            ]),
        );
    }
}
