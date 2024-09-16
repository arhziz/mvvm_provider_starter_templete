import 'package:flutter/material.dart';
import 'package:mvvm_project/core/domain/entities/sample.dart';
import 'package:mvvm_project/core/enums.dart';
import 'package:mvvm_project/core/presentation/view_models/sample_view_model.dart';
import 'package:mvvm_project/core/presentation/widgets/primary_button_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<SampleViewModel>().getSamples();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<SampleViewModel>(
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      if (child != null) child,
                      ListView.builder(
                        itemCount: value.samples.length,
                        itemBuilder: (context, index) {
                          Sample sample = value.samples[index];
                          return ListTile(
                            title: Text('${sample.id}'),
                          );
                        },
                      ),
                      if (value.sampleLoading)
                        Container(
                          color: Colors.white,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: const Center(
                      child: Text("Hello World"),
                    ),
                  ),
                  PrimaryButton(
                    action: () {},
                    title: "Go to Settings",
                    type: ButtonType.outlined,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
