import 'package:flutter/material.dart';

void showThemeBottomSheet({
  required BuildContext context,
  // required SortingTypeModel model,
}) {
  showModalBottomSheet(
    context: context,
    // backgroundColor: AppColors.white,
    // barrierColor: AppColors.darkTextWithOpacity40,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
    ),
    builder: (context) => Column(
      children: [
        Row(
          children: [
            Text(
              'Тема оформления',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const SizedBox(height: 8),
        RadioListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          title: const Text(
            "Системная",
          ),
          value: 'Системная',
          groupValue: '_radioGroup',
          onChanged: (value) {},
        ),
      ],
    ),
  );
}

/*

class _BodyModalWidget extends StatefulWidget {
  // final SortingTypeModel model;
  const _BodyModalWidget({
    required this.model,
  });

  @override
  State<_BodyModalWidget> createState() => _BodyModalWidgetState();
}

class _BodyModalWidgetState extends State<_BodyModalWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 24.0),
        child: Column(
          children: [
            const _TitleModalWidget(),
            const SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: RadioButtonList(model: widget.model),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleModalWidget extends StatelessWidget {
  const _TitleModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppStrings.sortingTitle,
            style: AppStyle.largeTitle20Bold,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.close,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }
}

class RadioButtonList extends StatefulWidget {
  final SortingTypeModel model;

  const RadioButtonList({super.key, required this.model});

  @override
  State<RadioButtonList> createState() => _RadioButtonListState();
}

class _RadioButtonListState extends State<RadioButtonList> {
  late SortingType _radioGroup;

  @override
  void initState() {
    super.initState();
    _radioGroup = widget.model.sortingType;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          activeColor: AppColors.green,
          title: const Text(
            "Без сортировки",
            style: AppStyle.radioText16Regular,
          ),
          value: SortingType.none,
          groupValue: _radioGroup,
          onChanged: (value) {
            setState(() {
              _radioGroup = value!;
              widget.model.changeType(value);
            });
          },
        ),
        const SizedBox(height: 8.0),
        const Divider(),
        const SizedBox(height: 8.0),
        const Text('По имени', style: AppStyle.cardText12Regular),
        RadioListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          activeColor: AppColors.green,
          title: const Text(
            "По имени от А до Я",
            style: AppStyle.radioText16Regular,
          ),
          value: SortingType.name,
          groupValue: _radioGroup,
          onChanged: (value) {
            setState(() {
              _radioGroup = value!;
              widget.model.changeType(value);
            });
          },
        ),
        RadioListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          activeColor: AppColors.green,
          title: const Text(
            "По имени от Я до А",
            style: AppStyle.radioText16Regular,
          ),
          value: SortingType.nameDESC,
          groupValue: _radioGroup,
          onChanged: (value) {
            setState(() {
              _radioGroup = value!;
              widget.model.changeType(value);
            });
          },
        ),
        const SizedBox(height: 8.0),
        const Divider(),
        const SizedBox(height: 8.0),
        const Text('По цене', style: AppStyle.cardText12Regular),
        RadioListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          activeColor: AppColors.green,
          title: const Text(
            "По возрастанию",
            style: AppStyle.radioText16Regular,
          ),
          value: SortingType.price,
          groupValue: _radioGroup,
          onChanged: (value) {
            setState(() {
              _radioGroup = value!;
              widget.model.changeType(value);
            });
          },
        ),
        RadioListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          activeColor: AppColors.green,
          title: const Text(
            "По убыванию",
            style: AppStyle.radioText16Regular,
          ),
          value: SortingType.priceDESC,
          groupValue: _radioGroup,
          onChanged: (value) {
            setState(() {
              _radioGroup = value!;
              widget.model.changeType(value);
            });
          },
        ),
        const SizedBox(height: 8.0),
        const Divider(),
        const SizedBox(height: 8.0),
        const Text('По типу', style: AppStyle.cardText12Regular),
        RadioListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          activeColor: AppColors.green,
          title: const Text(
            "По типу от А до Я",
            style: AppStyle.radioText16Regular,
          ),
          value: SortingType.type,
          groupValue: _radioGroup,
          onChanged: (value) {
            setState(() {
              _radioGroup = value!;
              widget.model.changeType(value);
            });
          },
        ),
        RadioListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          activeColor: AppColors.green,
          title: const Text(
            "По типу от Я до А",
            style: AppStyle.radioText16Regular,
          ),
          value: SortingType.typeDESC,
          groupValue: _radioGroup,
          onChanged: (value) {
            setState(() {
              _radioGroup = value!;
              widget.model.changeType(value);
            });
          },
        ),
      ],
    );
  }
}
*/