import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AppTheme redTheme() {
    return AppTheme(
      id: 'wine_red',
      description: "Wine Red",
      data: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }

  AppTheme greenTheme() {
    return AppTheme(
      id: 'forest_green',
      description: "Forest Green",
      data: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }

  AppTheme purpleTheme() {
    return AppTheme(
      id: 'lavender_purple',
      description: "Lavender Purple",
      data: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }

  AppTheme blueGreyTheme() {
    return AppTheme(
      id: 'blue_whale',
      description: "Blue Whale",
      data: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }

  AppTheme yellowTheme() {
    return AppTheme(
      id: 'mango_mojito',
      description: "Mango Mojito",
      data: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }

  AppTheme cyanTheme() {
    return AppTheme(
      id: 'blumine_cyan',
      description: "Blumine Cyan",
      data: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }

  AppTheme amberTheme() {
    return AppTheme(
      id: 'amber_gold',
      description: "Amber Gold",
      data: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }

  AppTheme limeTheme() {
    return AppTheme(
      id: 'lime_yellow',
      description: "Lime Yellow",
      data: ThemeData(
        primarySwatch: Colors.lime,
      ),
    );
  }

  AppTheme indigoTheme() {
    return AppTheme(
      id: 'indigo_nights',
      description: "Indigo Nights",
      data: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }

  AppTheme pinkTheme() {
    return AppTheme(
      id: 'flower_pink',
      description: "Flower Pink",
      data: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }

  AppTheme deepOrangeTheme() {
    return AppTheme(
      id: 'orange_peel',
      description: "Orange Peel",
      data: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }

  AppTheme lightTheme() {
    return AppTheme(
      id: 'aqua_blue',
      description: "Aqua Blue",
      data: ThemeData.light(),
    );
  }

  AppTheme darkTheme() {
    return AppTheme(
      id: 'carbon_black',
      description: "Carbon Black",
      data: ThemeData.dark(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness = SchedulerBinding.instance?.window.platformBrightness ?? Brightness.light;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('carbon_black');
          } else {
            controller.setTheme('aqua_blue');
          }
        }
      },
      themes: <AppTheme>[
        lightTheme(),
        darkTheme(),
        yellowTheme(),
        redTheme(),
        greenTheme(),
        purpleTheme(),
        blueGreyTheme(),
        cyanTheme(),
        amberTheme(),
        pinkTheme(),
        deepOrangeTheme(),
        indigoTheme(),
        limeTheme()
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Flutter',
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(title: 'Flutter Theme Color Properties'),

          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: (){
                showDialog(context: context, builder: (_) => ThemeDialog(hasDescription:false,innerCircleRadius: 20,title: const Text("Please Select")));
              },
              icon: const Icon(Icons.color_lens_rounded)
          )
        ]
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Theme.of(context).hoverColor,height: 30,child: const Text("hoverColor")),
                Container(color: Theme.of(context).primaryColorDark,height: 30,child: const Text("primaryColorDark")),
                Container(color: Theme.of(context).primaryColor,height: 30,child: const Text("primaryColor")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Theme.of(context).indicatorColor,height: 30,child: const Text("indicatorColor")),
                Container(color: Theme.of(context).canvasColor,height: 30,child: const Text("canvasColor")),
                Container(color: Theme.of(context).disabledColor,height: 30,child: const Text("disabledColor")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Theme.of(context).highlightColor,height: 30,child: const Text("highlightColor")),
                Container(color: Theme.of(context).backgroundColor,height: 30,child: const Text("backgroundColor")),
                Container(color: Theme.of(context).bottomAppBarColor,height: 30,child: const Text("bottomAppBarColor")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Theme.of(context).dialogBackgroundColor,height: 30,child: const Text("dialogBackgroundColor")),
                Container(color: Theme.of(context).cardColor,height: 30,child: const Text("cardColor")),
                Container(color: Theme.of(context).dividerColor,height: 30,child: const Text("dividerColor")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Theme.of(context).errorColor,height: 30,child: const Text("errorColor")),
                Container(color: Theme.of(context).toggleableActiveColor,height: 30,child: const Text("toggleableActiveColor")),
                Container(color: Theme.of(context).hintColor,height: 30,child: const Text("hintColor")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Theme.of(context).scaffoldBackgroundColor,height: 30,child: const Text("scaffoldBackgroundColor")),
                Container(color: Theme.of(context).secondaryHeaderColor,height: 30,child: const Text("secondaryHeaderColor")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Theme.of(context).selectedRowColor,height: 30,child: const Text("selectedRowColor")),
                Column(
                  children: [
                    Container(color: Theme.of(context).shadowColor,height: 30,child: const Text("shadowColor")),
                    const Text("shadowColor")
                  ],
                ),
                Container(color: Theme.of(context).splashColor,height: 30,child: const Text("splashColor")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Theme.of(context).primaryColorLight,height: 30,child: const Text("primaryColorLight")),
                Container(color: Theme.of(context).focusColor,height: 30,child: const Text("focusColor")),
                Container(color: Theme.of(context).unselectedWidgetColor,height: 30,child: const Text("unselectedWidgetColor")),
              ],
            ),
        ],
      )
    );
  }
}
