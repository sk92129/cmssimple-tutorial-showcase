import 'package:cmssimple/cms_utils.dart';
import 'package:cmssimple/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CmsText extends StatefulWidget {
  const CmsText({super.key, required this.itemName});
  final String itemName;

  @override
  State<CmsText> createState() => _CmsTextState();
}

class _CmsTextState extends State<CmsText> {
  DataModel? item;
  String? style;
  Map<String, DataModel> dataModels = {};

  Future<List<dynamic>> initializeData() async {
    List<dynamic> list = await CmsRepository.fetchCmsContent(
      "testing123!",
      "https://9qfcvfxf-dev.webengine.zesty.io/-/gql/",
      "textboxes.json",
    );
    return list;
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    var mylist = await initializeData();
    for (var item in mylist) {
      DataModel dataModel = DataModel.fromJson(item);
      dataModels[dataModel.name] = dataModel;
    }
    // pizzaMainTitle is the name of the item in the json file
    setState(() {
      item = dataModels[widget.itemName];
    });

    debugPrint(item?.html);
    debugPrint(item?.style);
    debugPrint(item?.name);
    debugPrint(item?.body);
  }

  @override
  Widget build(context) {
    if (item == null) {
      return const CircularProgressIndicator();
    }

    // Get the style from the data model
    style = dataModels[widget.itemName]?.style;

    return Html(
      data: item?.html ?? "",
      extensions: [
        TagExtension(tagsToExtend: {"flutter"}, child: const FlutterLogo()),
      ],
    );
  }
}
