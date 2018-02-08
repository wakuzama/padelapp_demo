import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'all.dart';

typedef Widget GalleryDemoBuilder();

class SampleItem extends StatelessWidget {
  const SampleItem({
    @required this.title,
    this.subtitle,
    @required this.category,
    @required this.routeName,
    @required this.buildRoute,
  }) : assert(title != null),
        assert(category != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final String subtitle;
  final String category;
  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(title),
        subtitle: new Text(subtitle),
        onTap: () {
          if (routeName != null) {
            Timeline.instantSync('Start Transition', arguments: <String, String>{
              'from': '/',
              'to': routeName
            });
            Navigator.pushNamed(context, routeName);
          }
        }
    );
  }
}

List<SampleItem> _buildSampleItems() {
  // When editing this list, make sure you keep it in sync with
  // the list in ../../test_driver/transitions_perf_test.dart
  final List<SampleItem> sampleItems = <SampleItem>[
    // Demos
    new SampleItem(
      title: 'Addresses',
      subtitle: 'View and Edit Addresses',
      category: 'Player',
      routeName: EditAddress.routeName,
      buildRoute: (BuildContext context) => new EditAddress(),
    ),
//    new SampleItem(
//      title: 'Contact profile',
//      subtitle: 'Address book entry with a flexible appbar',
//      category: 'Demos',
//      //routeName: ContactsDemo.routeName,
//      //buildRoute: (BuildContext context) => new ContactsDemo(),
//    ),
//    new SampleItem(
//      title: 'Animation',
//      subtitle: 'Section organizer',
//      category: 'Demos',
//      routeName: AnimationDemo.routeName,
//      buildRoute: (BuildContext context) => const AnimationDemo(),
//    ),
//    new SampleItem(
//      title: 'Video',
//      subtitle: 'Video playback',
//      category: 'Demos',
//      routeName: VideoDemo.routeName,
//      buildRoute: (BuildContext context) => const VideoDemo(),
//    ),
//    // Material Components
//    new SampleItem(
//      title: 'Bottom navigation',
//      subtitle: 'Bottom navigation with cross-fading views',
//      category: 'Material Components',
//      routeName: BottomNavigationDemo.routeName,
//      buildRoute: (BuildContext context) => new BottomNavigationDemo(),
//    ),
//    new SampleItem(
//      title: 'Buttons',
//      subtitle: 'All kinds: flat, raised, dropdown, icon, etc',
//      category: 'Material Components',
//      routeName: ButtonsDemo.routeName,
//      buildRoute: (BuildContext context) => new ButtonsDemo(),
//    ),
//    new SampleItem(
//      title: 'Cards',
//      subtitle: 'Material with rounded corners and a drop shadow',
//      category: 'Material Components',
//      routeName: CardsDemo.routeName,
//      buildRoute: (BuildContext context) => new CardsDemo(),
//    ),
//    new SampleItem(
//      title: 'Chips',
//      subtitle: 'Label with an optional delete button and avatar',
//      category: 'Material Components',
//      routeName: ChipDemo.routeName,
//      buildRoute: (BuildContext context) => new ChipDemo(),
//    ),
//    new SampleItem(
//      title: 'Date and time pickers',
//      subtitle: 'Date and time selection widgets',
//      category: 'Material Components',
//      routeName: DateAndTimePickerDemo.routeName,
//      buildRoute: (BuildContext context) => new DateAndTimePickerDemo(),
//    ),
//    new SampleItem(
//      title: 'Dialog',
//      subtitle: 'All kinds: simple, alert, fullscreen, etc',
//      category: 'Material Components',
//      routeName: DialogDemo.routeName,
//      buildRoute: (BuildContext context) => new DialogDemo(),
//    ),
//    new SampleItem(
//      title: 'Drawer',
//      subtitle: 'Navigation drawer with a standard header',
//      category: 'Material Components',
//      routeName: DrawerDemo.routeName,
//      buildRoute: (BuildContext context) => new DrawerDemo(),
//    ),
//    new SampleItem(
//      title: 'Expand/collapse list control',
//      subtitle: 'List with one level of sublists',
//      category: 'Material Components',
//      routeName: TwoLevelListDemo.routeName,
//      buildRoute: (BuildContext context) => new TwoLevelListDemo(),
//    ),
//    new SampleItem(
//      title: 'Expansion panels',
//      subtitle: 'List of expanding panels',
//      category: 'Material Components',
//      routeName: ExpasionPanelsDemo.routeName,
//      buildRoute: (BuildContext context) => new ExpasionPanelsDemo(),
//    ),
//    new SampleItem(
//      title: 'Floating action button',
//      subtitle: 'Action buttons with transitions',
//      category: 'Material Components',
//      routeName: TabsFabDemo.routeName,
//      buildRoute: (BuildContext context) => new TabsFabDemo(),
//    ),
//    new SampleItem(
//      title: 'Grid',
//      subtitle: 'Row and column layout',
//      category: 'Material Components',
//      routeName: GridListDemo.routeName,
//      buildRoute: (BuildContext context) => const GridListDemo(),
//    ),
//    new SampleItem(
//      title: 'Icons',
//      subtitle: 'Enabled and disabled icons with varying opacity',
//      category: 'Material Components',
//      routeName: IconsDemo.routeName,
//      buildRoute: (BuildContext context) => new IconsDemo(),
//    ),
//    new SampleItem(
//      title: 'Leave-behind list items',
//      subtitle: 'List items with hidden actions',
//      category: 'Material Components',
//      routeName: LeaveBehindDemo.routeName,
//      buildRoute: (BuildContext context) => const LeaveBehindDemo(),
//    ),
//    new SampleItem(
//      title: 'List',
//      subtitle: 'Layout variations for scrollable lists',
//      category: 'Material Components',
//      routeName: ListDemo.routeName,
//      buildRoute: (BuildContext context) => const ListDemo(),
//    ),
//    new SampleItem(
//      title: 'Menus',
//      subtitle: 'Menu buttons and simple menus',
//      category: 'Material Components',
//      routeName: MenuDemo.routeName,
//      buildRoute: (BuildContext context) => const MenuDemo(),
//    ),
//    new SampleItem(
//      title: 'Modal bottom sheet',
//      subtitle: 'Modal sheet that slides up from the bottom',
//      category: 'Material Components',
//      routeName: ModalBottomSheetDemo.routeName,
//      buildRoute: (BuildContext context) => new ModalBottomSheetDemo(),
//    ),
//    new SampleItem(
//      title: 'Page selector',
//      subtitle: 'PageView with indicator',
//      category: 'Material Components',
//      routeName: PageSelectorDemo.routeName,
//      buildRoute: (BuildContext context) => new PageSelectorDemo(),
//    ),
//    new SampleItem(
//      title: 'Persistent bottom sheet',
//      subtitle: 'Sheet that slides up from the bottom',
//      category: 'Material Components',
//      routeName: PersistentBottomSheetDemo.routeName,
//      buildRoute: (BuildContext context) => new PersistentBottomSheetDemo(),
//    ),
//    new SampleItem(
//      title: 'Progress indicators',
//      subtitle: 'All kinds: linear, circular, indeterminate, etc',
//      category: 'Material Components',
//      routeName: ProgressIndicatorDemo.routeName,
//      buildRoute: (BuildContext context) => new ProgressIndicatorDemo(),
//    ),
//    new SampleItem(
//      title: 'Pull to refresh',
//      subtitle: 'Refresh indicators',
//      category: 'Material Components',
//      routeName: OverscrollDemo.routeName,
//      buildRoute: (BuildContext context) => const OverscrollDemo(),
//    ),
//    new SampleItem(
//      title: 'Scrollable tabs',
//      subtitle: 'Tab bar that scrolls',
//      category: 'Material Components',
//      routeName: ScrollableTabsDemo.routeName,
//      buildRoute: (BuildContext context) => new ScrollableTabsDemo(),
//    ),
//    new SampleItem(
//      title: 'Selection controls',
//      subtitle: 'Checkboxes, radio buttons, and switches',
//      category: 'Material Components',
//      routeName: SelectionControlsDemo.routeName,
//      buildRoute: (BuildContext context) => new SelectionControlsDemo(),
//    ),
//    new SampleItem(
//      title: 'Sliders',
//      subtitle: 'Widgets that select a value by dragging the slider thumb',
//      category: 'Material Components',
//      routeName: SliderDemo.routeName,
//      buildRoute: (BuildContext context) => new SliderDemo(),
//    ),
//    new SampleItem(
//      title: 'Snackbar',
//      subtitle: 'Temporary message that appears at the bottom',
//      category: 'Material Components',
//      routeName: SnackBarDemo.routeName,
//      buildRoute: (BuildContext context) => const SnackBarDemo(),
//    ),
//    new SampleItem(
//      title: 'Tabs',
//      subtitle: 'Tabs with independently scrollable views',
//      category: 'Material Components',
//      routeName: TabsDemo.routeName,
//      buildRoute: (BuildContext context) => new TabsDemo(),
//    ),
//    new SampleItem(
//      title: 'Text fields',
//      subtitle: 'Single line of editable text and numbers',
//      category: 'Material Components',
//      routeName: TextFormFieldDemo.routeName,
//      buildRoute: (BuildContext context) => const TextFormFieldDemo(),
//    ),
//    new SampleItem(
//      title: 'Tooltips',
//      subtitle: 'Short message displayed after a long-press',
//      category: 'Material Components',
//      routeName: TooltipDemo.routeName,
//      buildRoute: (BuildContext context) => new TooltipDemo(),
//    ),
//    // Cupertino Components
//    new SampleItem(
//      title: 'Activity Indicator',
//      subtitle: 'Cupertino styled activity indicator',
//      category: 'Cupertino Components',
//      routeName: CupertinoProgressIndicatorDemo.routeName,
//      buildRoute: (BuildContext context) => new CupertinoProgressIndicatorDemo(),
//    ),
//    new SampleItem(
//      title: 'Buttons',
//      subtitle: 'Cupertino styled buttons',
//      category: 'Cupertino Components',
//      routeName: CupertinoButtonsDemo.routeName,
//      buildRoute: (BuildContext context) => new CupertinoButtonsDemo(),
//    ),
//    new SampleItem(
//      title: 'Dialogs',
//      subtitle: 'Cupertino styled dialogs',
//      category: 'Cupertino Components',
//      routeName: CupertinoDialogDemo.routeName,
//      buildRoute: (BuildContext context) => new CupertinoDialogDemo(),
//    ),
//    new SampleItem(
//      title: 'Navigation',
//      subtitle: 'Cupertino styled navigation patterns',
//      category: 'Cupertino Components',
//      routeName: CupertinoNavigationDemo.routeName,
//      buildRoute: (BuildContext context) => new CupertinoNavigationDemo(),
//    ),
//    new SampleItem(
//      title: 'Sliders',
//      subtitle: 'Cupertino styled sliders',
//      category: 'Cupertino Components',
//      routeName: CupertinoSliderDemo.routeName,
//      buildRoute: (BuildContext context) => new CupertinoSliderDemo(),
//    ),
//    new SampleItem(
//      title: 'Switches',
//      subtitle: 'Cupertino styled switches',
//      category: 'Cupertino Components',
//      routeName: CupertinoSwitchDemo.routeName,
//      buildRoute: (BuildContext context) => new CupertinoSwitchDemo(),
//    ),
//    // Media
//    new SampleItem(
//      title: 'Animated images',
//      subtitle: 'GIF and WebP animations',
//      category: 'Media',
//      routeName: ImagesDemo.routeName,
//      buildRoute: (BuildContext context) => new ImagesDemo(),
//    ),
//    // Styles
//    new SampleItem(
//      title: 'Colors',
//      subtitle: 'All of the predefined colors',
//      category: 'Style',
//      routeName: ColorsDemo.routeName,
//      buildRoute: (BuildContext context) => new ColorsDemo(),
//    ),
//    new SampleItem(
//      title: 'Typography',
//      subtitle: 'All of the predefined text styles',
//      category: 'Style',
//      routeName: TypographyDemo.routeName,
//      buildRoute: (BuildContext context) => new TypographyDemo(),
//    )
  ];

  // Keep Pesto around for its regression test value. It is not included
  // in (release builds) the performance tests.
//  assert(() {
//    galleryItems.insert(0,
//      new SampleItem(
//        title: 'Pesto',
//        subtitle: 'Simple recipe browser',
//        category: 'Demos',
//        routeName: PestoDemo.routeName,
//        buildRoute: (BuildContext context) => const PestoDemo(),
//      ),
//    );
//    return true;
//  }());

  return sampleItems;
}

final List<SampleItem> kAllGalleryItems = _buildSampleItems();
//class SamplePage extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      padding: const EdgeInsets.all(12.0),
//      child: new Card(
//        child: new Center(
//          child: new Icon(Icons.android, size: 50.0, color: Colors.lightBlue),
//        ),
//      ),
//    );
//  }
//}
