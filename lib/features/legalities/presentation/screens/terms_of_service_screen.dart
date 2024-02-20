import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:markdown/markdown.dart' as md;
import '../../../../service_locator/service_locator.dart';

class TermsOfServiceScreen extends StatefulWidget {
  const TermsOfServiceScreen({super.key});

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  final _editFormKey = GlobalKey<FormBuilderState>();
  late String _markdownData;

  @override
  void initState() {
    super.initState();

    _markdownData = '''
This is inline latex: \$f(x) = \\sum_{i=0}^{n} \\frac{a_i}{1+x}\$

This is block level latex:

\$
c = \\pm\\sqrt{a^2 + b^2}
\$

This is inline latex with displayMode: \$\$f(x) = \\sum_{i=0}^{n} \\frac{a_i}{1+x}\$\$

To calculate the area of an equilateral triangle using trigonometric functions, one can consider using the length of the side and the height. The relationship between the height and the side length of an equilateral triangle is:

\\[ \\text{Height} = \\frac{\\sqrt{3}}{2} \\times \\text{Side Length} \\]

因此，边长为 9 的正三角形的面积为：

\\[ \\text{面积} = \\frac{1}{2} \\times \\text{底} \\times \\text{高} = \\frac{1}{2} \\times 9 \\times \\frac{\\sqrt{3}}{2} \\times 9 = \\frac{81\\sqrt{3}}{4} \\]

所以正三角形的面积为 \\( \\frac{81\\sqrt{3}}{4} \\)。

''';
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => GoRouter.of(context).go('/signup'),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => GoRouter.of(context).go('/signup'),
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Text('Terms of Service'),
              bottom: TabBar(
                onTap: (value) {
                  services<Logger>().i('Tab index: $value');

                  if (value == 0) {
                    setState(() {
                      _editFormKey.currentState?.fields['question']
                          ?.didChange(_markdownData);
                    });
                  }
                },
                tabs: const <Widget>[
                  Tab(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.edit_outlined),
                        SizedBox(width: 8.0),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  Tab(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.preview_outlined),
                        SizedBox(width: 8.0),
                        Text('Preview'),
                      ],
                    ),
                    // text: 'Preview',
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: TabBarView(
                children: <Widget>[
                  // Edit.
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: FormBuilder(
                        key: _editFormKey,
                        child: Column(
                          children: <Widget>[
                            // Question.
                            FormBuilderTextField(
                              name: 'question',
                              // TODO: [P2]: Make maxLines a user option.
                              maxLines: null,
                              minLines: 6,
                              initialValue: _markdownData,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(5),
                                // TODO [P3]: Needs more user research. Subject to change.
                                FormBuilderValidators.maxLength(1500),
                              ]),
                              onChanged: (String? value) {
                                setState(() {
                                  _markdownData = value ?? '';
                                });
                              },
                            ),

                            // Choices
                            SizedBox(height: 400.0)
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Preview.
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Card(
                      child: Markdown(
                        data: _markdownData,
                        builders: {
                          'latex': LatexElementBuilder(),
                        },
                        extensionSet: md.ExtensionSet(
                          [LatexBlockSyntax()],
                          [LatexInlineSyntax()],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
