import 'package:challenge/utils/constants.dart';
import 'package:challenge/views/screens/profile.dart';
import 'package:challenge/views/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: NestedScrollView(
          controller: ScrollController(keepScrollOffset: false),
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                centerTitle: false,
                pinned: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Mon, Jan 20 2020",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Hi, ",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextSpan(
                          text: "Regis imuduhe Safari",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ProfileScreen()));
                      },
                      child: CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              AssetImage("assets/images/male.png")),
                    ),
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: Size(10, 10),
                  child: Container(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        icon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (context, i) {
                      return TaskCategories(
                        index: i + 1,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Invitation",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    onTap: () {},
                    title: Text("Samantha william"),
                    subtitle: Text("Samantha was invite you"),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.green,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  child: Text(
                    "My team",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ];
          },
          body: Builder(builder: (context1) {
            return ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    child: Text(
                      "${i + 1}",
                      style: TextStyle(
                          color: i % 2 == 0 ? Colors.green : Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  trailing: i % 2 == 0
                      ? CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.orange.shade100,
                          child: Icon(
                            Icons.beach_access_outlined,
                            color: Colors.orange,
                            size: 20,
                          ),
                        )
                      : Container(
                          width: 50,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              Positioned(
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage(
                                    "assets/images/male.png",
                                  ),
                                ),
                                left: 0,
                              ),
                              Positioned(
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage(
                                    "assets/images/female.png",
                                  ),
                                ),
                                right: 0,
                              ),
                            ],
                          ),
                        ),
                  title: Text("Team name ${i + 1}"),
                  subtitle: Text("You have 5 friends"),
                );
              },
              controller: PrimaryScrollController.of(context1),
              padding: EdgeInsets.only(top: 0),
            );
          }),
        ),
      ),
    );
  }
}
