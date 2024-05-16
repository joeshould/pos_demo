import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poslink2/model/comm_setting_view_model.dart';
import 'package:poslink2/model/test_view_model.dart';
import 'package:provider/provider.dart';

class TestView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  bool progressing = false;
  late ScrollController scrollController;
  late CommSettingViewModel commSettingViewModel;

  @override
  void initState() {
    scrollController = ScrollController();
    commSettingViewModel = context.read<CommSettingViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TestViewModel>(
      builder: (context, viewModel, child) {
        List<Widget> buttonList = [];
        if (!progressing) {
          buttonList.add(IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () async {
              setState(() {
                FocusScope.of(context).requestFocus(FocusNode());
                progressing = true;
              });
              await viewModel.transactionStartTest(commSettingViewModel);
              setState(() {
                progressing = false;
              });
            },
          ));
        } else {
          buttonList.add(Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          ));
          buttonList.add(IconButton(
            icon: Icon(Icons.stop),
            onPressed: () {
              viewModel.stop = true;
              setState(() {
                progressing = false;
              });
            },
          ));
        }

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
            scrollController.jumpTo(scrollController.position.maxScrollExtent));

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller:
                    TextEditingController(text: viewModel.count.toString()),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                maxLines: null,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Execution count",
                ),
                onChanged: (String value) {
                  viewModel.count = int.parse(value);
                },
                onSubmitted: (String value) {
                  viewModel.count = int.parse(value);
                },
              ),
              Row(
                children: buttonList,
              ),
              Text("Progress:" +
                  viewModel.times.toString() +
                  "/" +
                  viewModel.count.toString()),
              Text("Result:"),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    width: double.infinity,
                    child: Text(viewModel.data),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
