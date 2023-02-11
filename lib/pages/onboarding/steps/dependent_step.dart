import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/dependents_modal.dart';
import 'package:flutter_flow_bank/utils/list.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';

class DependentStep extends StatelessWidget {
  final Function() validate;
  final List<Dependent> dependents;
  final Function(Dependent) onDependentSaved;
  final Function(Dependent) onDependentDeleted;
  DependentStep({
    super.key,
    required this.onDependentSaved,
    required this.dependents,
    required this.onDependentDeleted,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: buildDependentsListView(),
        ),
        PrimaryButton(
          buttonText: 'Continue',
          onPressed: validate,
        ),
      ],
    );
  }

  ListView buildDependentsListView() {
    return ListView.builder(
      itemCount: dependents.length + 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == dependents.length) {
          return buildAddListTile(context);
        }
        Dependent dependent = dependents[index];
        return ListTile(
          contentPadding: EdgeInsets.only(left: Spacing.xs),
          title: Text(
            dependent.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: IconButton(
            onPressed: () {
              onDependentDeleted(dependent);
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          shape: buildShape(index),
        );
      },
    );
  }

  ListTile buildAddListTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: Spacing.xs),
      title: Text(
        "Add Dependent",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        onPressed: () async {
          String? dependent = await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            enableDrag: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) => DependentsModal(),
          );
          if (dependent != null) {
            onDependentSaved(Dependent(dependent));
          }
        },
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      shape: buildShape(dependents.length),
    );
  }

  RoundedRectangleBorder buildShape(int index) {
    return RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.grey.shade400,
      ),
      borderRadius: BorderRadius.vertical(
        top: index == 0 || dependents.isEmpty
            ? const Radius.circular(
                8,
              )
            : const Radius.circular(0),
        bottom: index == dependents.length
            ? const Radius.circular(
                8,
              )
            : const Radius.circular(0),
      ),
    );
  }
}
