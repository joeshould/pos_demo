import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_log_set.dart';
import 'package:poslink2/model/log_setting_view_model.dart';
import 'package:provider/provider.dart';

class LogSettingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogSettingViewState();
}

class _LogSettingViewState extends State<LogSettingView> {
  List<String> levelList = [
    "ERROR",
    "DEBUG",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<LogSettingViewModel>(
      builder: (context, viewModel, child) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Row(
              children: [
                Text(
                  "Enable",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Switch(
                    value: viewModel.enable,
                    onChanged: (bool newValue) {
                      setState(() {
                        viewModel.enable = newValue;
                      });
                    })
              ],
            ),
            PopupMenuButton(
              tooltip: "",
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: LogLevel.ERROR,
                    child: Text(levelList[0]),
                  ),
                  PopupMenuItem(
                    value: LogLevel.DEBUG,
                    child: Text(levelList[1]),
                  ),
                ];
              },
              onSelected: (LogLevel level) {
                viewModel.level = level;
              },
              offset: Offset(1, 30),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Log Level",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(levelList[viewModel.level.index]),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            TextField(
              controller:
                  TextEditingController(text: viewModel.days.toString()),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              maxLines: null,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Log Days",
              ),
              onChanged: (String value) {
                viewModel.days = int.parse(value);
              },
              onSubmitted: (String value) {
                viewModel.days = int.parse(value);
              },
            ),
            TextField(
              controller: TextEditingController(text: viewModel.fileName),
              maxLines: null,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Log File Name",
              ),
              onChanged: (String value) {
                viewModel.fileName = value;
              },
              onSubmitted: (String value) {
                viewModel.fileName = value;
              },
            ),
            TextField(
              controller: TextEditingController(text: viewModel.filePath),
              maxLines: null,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Log File Path",
              ),
              onChanged: (String value) {
                viewModel.filePath = value;
              },
              onSubmitted: (String value) {
                viewModel.filePath = value;
              },
            ),
          ],
        );
      },
    );
  }
}
