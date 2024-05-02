import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:markdown/markdown.dart' as md;

class LatexSampleDisplay extends StatelessWidget {
  const LatexSampleDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    String latexString = r"""
This is inline latex: $f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$
INLINE LATEX NEEDS TEXT BEFORE \$ \$, even a space would do too.
One space in between lines for a newline

This is block level latex:
$$
c = \pm\sqrt{a^2 + b^2}
$$

This is inline latex with displayMode: $$f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$$

The relationship between the height and the side length of an equilateral triangle is:

\[ \text{Height} = \frac{\sqrt{3}}{2} \times \text{Side Length} \]

\[ \text{X} = \frac{1}{2} \times \text{Y} \times \text{Z} = \frac{1}{2} \times 9 \times \frac{\sqrt{3}}{2} \times 9 = \frac{81\sqrt{3}}{4} \]

The basic form of the Taylor series is:

\[f(x) = f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \frac{f'''(a)}{3!}(x-a)^3 + \cdots\]

where \(f(x)\) is the function to be expanded, \(a\) is the expansion point, \(f'(a)\), \(f''(a)\), \(f'''(a)\), etc., are the first, second, third, and so on derivatives of the function at point \(a\), and \(n!\) denotes the factorial of \(n\).
""";
    return Center(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(
                  207, 0, 15, 1), // Set your desired color here
              width: 2.0, // Set your desired width here
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Text(latexString),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(
                  207, 0, 15, 1), // Set your desired color here
              width: 2.0, // Set your desired width here
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: TextMarkdown(text: latexString),
        )
      ],
    ));
  }
}

class TextMarkdown extends StatelessWidget {
  const TextMarkdown({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      data: text,
      builders: {
        'latex': LatexElementBuilder(
          textScaleFactor: 1.2,
          textStyle: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      },
      styleSheet: MarkdownStyleSheet(
        textAlign: WrapAlignment.center,
        p: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
      ),
      extensionSet: md.ExtensionSet(
        [LatexBlockSyntax()],
        [LatexInlineSyntax()],
      ),
    );
  }
}
