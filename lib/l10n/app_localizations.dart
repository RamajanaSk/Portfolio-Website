import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'HOME'**
  String get home;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'ABOUT'**
  String get about;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'PROJECTS'**
  String get projects;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'CONTACT'**
  String get contact;

  /// No description provided for @german.
  ///
  /// In en, this message translates to:
  /// **'GERMAN'**
  String get german;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'ENGLISH'**
  String get english;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'RAMAJANA'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'SKOPLJAK'**
  String get surname;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'MOBILE DEVELOPER'**
  String get role;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'FLUTTER • MOBILE • INTERACTIVE EXPERIENCES'**
  String get heroDescription;

  /// No description provided for @heroSubDescription.
  ///
  /// In en, this message translates to:
  /// **'BUILDING PERFORMANT, USER-FOCUSED APPLICATIONS.'**
  String get heroSubDescription;

  /// No description provided for @homeDescription.
  ///
  /// In en, this message translates to:
  /// **'BUILDING IMMERSIVE MOBILE AND INTERACTIVE EXPERIENCES WITH FLUTTER, UNITY AND MODERN UI SYSTEMS.'**
  String get homeDescription;

  /// No description provided for @featuredProjects.
  ///
  /// In en, this message translates to:
  /// **'FEATURED WORK & TECHNOLOGIES'**
  String get featuredProjects;

  /// No description provided for @technologies.
  ///
  /// In en, this message translates to:
  /// **'TECHNOLOGIES'**
  String get technologies;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'ABOUT ME'**
  String get aboutMe;

  /// No description provided for @aboutMeDescription.
  ///
  /// In en, this message translates to:
  /// **'I AM A DEVELOPER FOCUSED ON CROSS-PLATFORM MOBILE APPLICATIONS, COMBINING CLEAN AND RESPONSIVE UI DESIGN WITH SCALABLE ARCHITECTURE AND INTERACTIVE EXPERIENCES. MY BACKGROUND INCLUDES FLUTTER DEVELOPMENT, FULLSTACK SYSTEMS AND CREATIVE TECHNOLOGIES SUCH AS UNITY AND VR, ALLOWING ME TO APPROACH PROJECTS FROM BOTH A TECHNICAL AND CREATIVE PERSPECTIVE.'**
  String get aboutMeDescription;

  /// No description provided for @mobileComputing.
  ///
  /// In en, this message translates to:
  /// **'MOBILE COMPUTING'**
  String get mobileComputing;

  /// No description provided for @uiFocused.
  ///
  /// In en, this message translates to:
  /// **'UI / UX FOCUSED'**
  String get uiFocused;

  /// No description provided for @flutterDeveloper.
  ///
  /// In en, this message translates to:
  /// **'FLUTTER DEVELOPER'**
  String get flutterDeveloper;

  /// No description provided for @crossPlatform.
  ///
  /// In en, this message translates to:
  /// **'CROSS PLATFORM'**
  String get crossPlatform;

  /// No description provided for @techStack.
  ///
  /// In en, this message translates to:
  /// **'TECH STACK'**
  String get techStack;

  /// No description provided for @programming.
  ///
  /// In en, this message translates to:
  /// **'PROGRAMMING'**
  String get programming;

  /// No description provided for @frameworks.
  ///
  /// In en, this message translates to:
  /// **'FRAMEWORKS'**
  String get frameworks;

  /// No description provided for @databases.
  ///
  /// In en, this message translates to:
  /// **'DATABASES'**
  String get databases;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'TOOLS'**
  String get tools;

  /// No description provided for @mobileSpecialization.
  ///
  /// In en, this message translates to:
  /// **'MOBILE SPECIALIZATION'**
  String get mobileSpecialization;

  /// No description provided for @applicationsBuilt.
  ///
  /// In en, this message translates to:
  /// **'APPLICATIONS BUILT'**
  String get applicationsBuilt;

  /// No description provided for @creativeSystems.
  ///
  /// In en, this message translates to:
  /// **'CREATIVE SYSTEMS'**
  String get creativeSystems;

  /// No description provided for @letsBuild.
  ///
  /// In en, this message translates to:
  /// **'LET’S BUILD SOMETHING MEANINGFUL'**
  String get letsBuild;

  /// No description provided for @footerDescription.
  ///
  /// In en, this message translates to:
  /// **'CREATIVE DEVELOPER FOCUSED ON FLUTTER, MOBILE APPS AND INTERACTIVE EXPERIENCES.'**
  String get footerDescription;

  /// No description provided for @navigation.
  ///
  /// In en, this message translates to:
  /// **'NAVIGATION'**
  String get navigation;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'STUTTGART, GERMANY'**
  String get location;

  /// No description provided for @contactMe.
  ///
  /// In en, this message translates to:
  /// **'CONTACT'**
  String get contactMe;

  /// No description provided for @downloadCV.
  ///
  /// In en, this message translates to:
  /// **'DOWNLOAD CV'**
  String get downloadCV;

  /// No description provided for @viewPortfolio.
  ///
  /// In en, this message translates to:
  /// **'VIEW PORTFOLIO'**
  String get viewPortfolio;

  /// No description provided for @builtWithFlutter.
  ///
  /// In en, this message translates to:
  /// **'BUILT WITH FLUTTER'**
  String get builtWithFlutter;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
