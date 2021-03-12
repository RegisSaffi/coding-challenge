import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 300,
            elevation: 0,
            flexibleSpace: Container(
              color: Colors.orange.shade100,
              child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    left: -70,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.orange.shade300,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    bottom: -80,
                    right: -70,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.orange.shade300,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        "assets/graphics/dev.svg",
                        height: 250,
                      )),
                  Positioned(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                        ],
                      ),
                    ),
                    bottom: -1,
                    left: 0,
                    right: 0,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 30),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text("Create new task"),
                subtitle: Text("You can create new task in here"),
                trailing: FloatingActionButton(
                  key: Key('ac'),
                  onPressed: () {},
                  child: Icon(Icons.add),
                  mini: true,
                  elevation: 0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                "Ongoing task",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Stepper(
                currentStep: 0,
                physics: NeverScrollableScrollPhysics(),
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    children: <Widget>[
                      Container(
                        child: null,
                      ),
                      Container(
                        child: null,
                      ),
                    ],
                  );
                },
                steps: List.generate(
                  50,
                  (index) => Step(
                    title: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: index % 2 == 0
                            ? AssetImage(
                                "assets/images/male.png",
                              )
                            : AssetImage("assets/images/female.png"),
                      ),
                      title: Text(index % 2 == 0
                          ? "Call with jonathan Ruslam"
                          : "Collaboration with Sam"),
                      subtitle: Text("Jan 20, 2020  09 AM - 11 AM"),
                    ),
                    isActive: true,
                    state: index == 0 ? StepState.complete : StepState.indexed,
                    content: Container(),
                  ),
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
