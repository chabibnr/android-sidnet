import 'package:app/component/custom_input_decoration.dart';
import 'package:app/modules/gaji/model/gaji.dart';
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
    final Gaji model;
    final GlobalKey<FormBuilderState> formKey;

    @override
    Widget build(BuildContext context) {
        return FormBuilder(
            key: formKey,
            child: Column(children: [
                FormBuilderTextField(
                    name: 'gaji_id',
                    initialValue: model.gajiId,
                    decoration: CustomInputDecoration().floating('gaji_id'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_periode',
                    initialValue: model.gajiPeriode,
                    decoration: CustomInputDecoration().floating('gaji_periode'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pokok',
                    initialValue: model.gajiPokok,
                    decoration: CustomInputDecoration().floating('gaji_pokok'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_bruto',
                    initialValue: model.gajiBruto,
                    decoration: CustomInputDecoration().floating('gaji_bruto'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_total_pot',
                    initialValue: model.gajiTotalPot,
                    decoration: CustomInputDecoration().floating('gaji_total_pot'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_netto',
                    initialValue: model.gajiNetto,
                    decoration: CustomInputDecoration().floating('gaji_netto'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_posting',
                    initialValue: model.gajiPosting,
                    decoration: CustomInputDecoration().floating('gaji_posting'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_biaya_admin',
                    initialValue: model.gajiBiayaAdmin,
                    decoration: CustomInputDecoration().floating('gaji_biaya_admin'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_buka_rekening',
                    initialValue: model.gajiBukaRekening,
                    decoration: CustomInputDecoration().floating('gaji_buka_rekening'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_jam_lembur',
                    initialValue: model.gajiJamLembur,
                    decoration: CustomInputDecoration().floating('gaji_jam_lembur'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_lembur',
                    initialValue: model.gajiLembur,
                    decoration: CustomInputDecoration().floating('gaji_lembur'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_tunj_hadir',
                    initialValue: model.gajiTunjHadir,
                    decoration: CustomInputDecoration().floating('gaji_tunj_hadir'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_tunj_insentif',
                    initialValue: model.gajiTunjInsentif,
                    decoration: CustomInputDecoration().floating('gaji_tunj_insentif'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_tunj_makan',
                    initialValue: model.gajiTunjMakan,
                    decoration: CustomInputDecoration().floating('gaji_tunj_makan'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_tunj_lain',
                    initialValue: model.gajiTunjLain,
                    decoration: CustomInputDecoration().floating('gaji_tunj_lain'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pot_kesehatan',
                    initialValue: model.gajiPotKesehatan,
                    decoration: CustomInputDecoration().floating('gaji_pot_kesehatan'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pot_tenagakerja',
                    initialValue: model.gajiPotTenagakerja,
                    decoration: CustomInputDecoration().floating('gaji_pot_tenagakerja'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_menittelat',
                    initialValue: model.gajiMenittelat,
                    decoration: CustomInputDecoration().floating('gaji_menittelat'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pot_telat',
                    initialValue: model.gajiPotTelat,
                    decoration: CustomInputDecoration().floating('gaji_pot_telat'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pot_absensi',
                    initialValue: model.gajiPotAbsensi,
                    decoration: CustomInputDecoration().floating('gaji_pot_absensi'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pot_sangsi',
                    initialValue: model.gajiPotSangsi,
                    decoration: CustomInputDecoration().floating('gaji_pot_sangsi'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pot_denda',
                    initialValue: model.gajiPotDenda,
                    decoration: CustomInputDecoration().floating('gaji_pot_denda'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pot_angsuran',
                    initialValue: model.gajiPotAngsuran,
                    decoration: CustomInputDecoration().floating('gaji_pot_angsuran'),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                    name: 'gaji_pot_lain',
                    initialValue: model.gajiPotLain,
                    decoration: CustomInputDecoration().floating('gaji_pot_lain'),
                ),
                const SizedBox(height: 16),
            ]),
        );
    }
}
