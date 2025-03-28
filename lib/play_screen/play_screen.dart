import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Äußere Raster
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, outerBoxIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    // Innere Ratser
                    child: GridView.builder(
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, innerBoxIndex) {
                        int index = (outerBoxIndex * 9) + innerBoxIndex;
                        return GestureDetector(
                          onTap: () {
                            print(index.toString());
                          },
                          child: SizedBox.expand(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: Text(index.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(9, (index) {
                return Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(index.toString()),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
