import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';
import 'package:flutter_flow_bank/widgets/text_form_field.dart';

class AddressStep extends StatelessWidget {
  final Function() validate;
  final Address address;
  final Function(Address) updateAddress;
  const AddressStep(
      {super.key,
      required this.address,
      required this.updateAddress,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            children: [
              buildInputFormField(
                  "Address Line 1",
                  (addressLine1) =>
                      updateAddressField(addressLine1: addressLine1)),
              buildInputFormField(
                  "Address Line 2",
                  (addressLine2) =>
                      updateAddressField(addressLine2: addressLine2)),
              buildInputFormField(
                  "City", (city) => updateAddressField(city: city)),
              buildInputFormField(
                  "State/Province",
                  (stateProvince) =>
                      updateAddressField(stateProvince: stateProvince)),
              buildCountryListPicker("Country",
                  (country) => updateAddressField(country: country), context),
              buildInputFormField(
                  "Zip/Postal code",
                  (zipPostalCode) =>
                      updateAddressField(zipPostalCode: zipPostalCode)),
            ],
          ),
        ),
        PrimaryButton(
          buttonText: 'Continue',
          onPressed: () {
            validate();
          },
        ),
      ],
    );
  }

  void updateAddressField({
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? stateProvince,
    String? country,
    String? zipPostalCode,
  }) {
    Address updatedAddress = address.copyWith(
        addressLine1: addressLine1,
        addressLine2: addressLine2,
        city: city,
        stateProvince: stateProvince,
        country: country,
        zipPostalCode: zipPostalCode);
    updateAddress(updatedAddress);
  }

  InputFormField buildInputFormField(
      String fieldName, Function(String)? onSaved) {
    return InputFormField(
      onFieldSubmitted: onSaved,
      hintText: fieldName,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid ${fieldName.toLowerCase()}';
        }
        return null;
      },
    );
  }

  Widget buildCountryListPicker(
      String fieldName, Function(String?)? onSaved, context) {
    Country? country = Country.tryParse(address.country);
    return GestureDetector(
      onTap: () async {
        showCountryPicker(
          context: context,
          onSelect: (Country country) {
            onSaved!(country.name);
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Spacing.s),
        color: Colors.transparent,
        child: IgnorePointer(
          ignoring: true,
          child: TextFormField(
            controller: TextEditingController(text: country?.name ?? ""),
            decoration: InputDecoration(
              hintText: fieldName,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
