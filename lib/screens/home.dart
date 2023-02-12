import 'package:flutter/material.dart';
import 'package:yt_home/screens/home_tabs.dart';

// ignore: must_be_immutable
// class Demo {
//   final String name;
//   final String route;
//   final WidgetBuilder builder;

//   const Demo({required this.name, required this.route, required this.builder});
// }
class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
List<String> searchTerms = [
	"Offers",
	"Picnic Spots",
	"Famous Food",
	"Famous Spot",
	"Clothes Shops",
	"Most used vehicle",
	"Peoples choice",
	
];
	
// first overwrite to
// clear the search text
@override
List<Widget>? buildActions(BuildContext context) {
	return [
	IconButton(
		onPressed: () {
		query = '';
		},
		icon: Icon(Icons.clear),
	),
	];
}

// second overwrite to pop out of search menu
@override
Widget? buildLeading(BuildContext context) {
	return IconButton(
	onPressed: () {
		close(context, null);
	},
	icon: Icon(Icons.arrow_back),
	);
}

// third overwrite to show query result
@override
Widget buildResults(BuildContext context) {
	List<String> matchQuery = [];
	for (var fruit in searchTerms) {
	if (fruit.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(fruit);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result),
		);
	},
	);
}

// last overwrite to show the
// querying process at the runtime
@override
Widget buildSuggestions(BuildContext context) {
	List<String> matchQuery = [];
	for (var fruit in searchTerms) {
	if (fruit.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(fruit);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result),
		);
	},
	);
}
}

class Home extends StatefulWidget {
  const Home({super.key});
  // Set<String> categories = {"All", "Stoves", "XYZ", "ABC"};

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(),
      body: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // padding: const EdgeInsets.all(25.0),

              children: [
                // // ignore: prefer_const_constructors
                const Text(
                  "This is your city!!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),

                Image.network(
                    "https://images.squarespace-cdn.com/content/v1/5c180094a9e028ac5301d51c/1573586665900-M8QXYW1BC1ESXEFL1I2E/Uvac+Canyon+Hiking.jpg?format=1000w"),

                const SizedBox(
                  height: 50, // <-- SEE HERE
                ),
                const Text(
                  "EXPLORE YOUR CITY",
                  style: TextStyle(
                      color: Color.fromARGB(255, 240, 6, 6),
                      fontSize: 30,
                      // letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 50, // <-- SEE HERE
                ),
                Image.asset(
                  "/images/logo.png",
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 50, // <-- SEE HERE
                ),
                Image.asset(
                  "/images/logo.png",
                  height: 150,
                  fit: BoxFit.contain,
                )
              ],
            ),
          )),

      // body: HomeTab(),
    );
  }

  AppBar navBar() {
    return AppBar(
      title: Image.asset(
        "/images/C_logo.png",
        height: 50,
        fit: BoxFit.contain,
      ),
      backgroundColor: Colors.red,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.location_on)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined)),
        IconButton(onPressed: () {
          showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
              );
        }, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.grey, primary: Colors.black),
                child: const Text("Explore"),
              ),
              const SizedBox(
                // height: 50, // <-- SEE HERE
                width: 30,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "ALL",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )),
              const SizedBox(
                // height: 50, // <-- SEE HERE
                width: 30,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Special",
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(
                // height: 50, // <-- SEE HERE
                width: 30,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Exclusive",
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(
                // height: 50, // <-- SEE HERE
                width: 30,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Regional",
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(
                // height: 50, // <-- SEE HERE
                width: 30,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Premium",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
