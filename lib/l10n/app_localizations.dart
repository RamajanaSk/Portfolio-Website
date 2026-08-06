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
  /// **'PORTFOLIO'**
  String get viewPortfolio;

  /// No description provided for @builtWithFlutter.
  ///
  /// In en, this message translates to:
  /// **'BUILT WITH FLUTTER'**
  String get builtWithFlutter;

  /// No description provided for @letsBuildSomething.
  ///
  /// In en, this message translates to:
  /// **'LET’S BUILD SOMETHING GREAT TOGETHER. FEEL FREE TO REACH OUT FOR COLLABORATIONS OR OPPORTUNITIES.'**
  String get letsBuildSomething;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'YOUR NAME'**
  String get yourName;

  /// No description provided for @yourEmail.
  ///
  /// In en, this message translates to:
  /// **'YOUR EMAIL'**
  String get yourEmail;

  /// No description provided for @yourMessage.
  ///
  /// In en, this message translates to:
  /// **'YOUR MESSAGE'**
  String get yourMessage;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'SEND MESSAGE'**
  String get sendMessage;

  /// No description provided for @whatMakesMeSpecial.
  ///
  /// In en, this message translates to:
  /// **'WHAT MAKES ME SPECIAL'**
  String get whatMakesMeSpecial;

  /// No description provided for @travelerShortDescription.
  ///
  /// In en, this message translates to:
  /// **'A 3D SOCIAL TRAVEL EXPERIENCE COMBINING REAL-WORLD MOVEMENT WITH INTERACTIVE MAP EXPLORATION.'**
  String get travelerShortDescription;

  /// No description provided for @travelerCatchPhrase.
  ///
  /// In en, this message translates to:
  /// **'WHERE GAMING MEETS SOCIAL MEDIA'**
  String get travelerCatchPhrase;

  /// No description provided for @travelerLongDescription.
  ///
  /// In en, this message translates to:
  /// **'TRAVELER WAS DEVELOPED AS A RESPONSE TO THE GROWING DISCONNECT BETWEEN DIGITAL AND PHYSICAL EXPERIENCES. THE GOAL WAS TO CREATE AN APPLICATION THAT ENCOURAGES USERS TO EXPLORE THEIR REAL-WORLD ENVIRONMENT WHILE STILL ENJOYING INTERACTIVE DIGITAL FEATURES. THE APP COMBINES FLUTTER FOR A MODERN, INTUITIVE UI WITH UNITY FOR REAL-TIME 3D RENDERING. USING OPENSTREETMAP DATA, USERS CAN VISUALIZE THEIR SURROUNDINGS IN A DYNAMIC 3D ENVIRONMENT AND SEE BOTH THEIR OWN POSITION AND THAT OF THEIR FRIENDS. BY MERGING SOCIAL INTERACTION, GEOLOCATION, AND IMMERSIVE VISUALIZATION, TRAVELER TRANSFORMS MOVEMENT INTO A SHARED EXPERIENCE AND MOTIVATES USERS TO ACTIVELY EXPLORE THEIR ENVIRONMENT INSTEAD OF PASSIVELY CONSUMING CONTENT.'**
  String get travelerLongDescription;

  /// No description provided for @travelerProjectReason.
  ///
  /// In en, this message translates to:
  /// **'THE MOTIVATION BEHIND TRAVELER WAS TO COUNTERBALANCE EXCESSIVE SCREEN TIME WITH MEANINGFUL REAL-WORLD INTERACTION. INSTEAD OF REPLACING REALITY, THE APP ENHANCES IT BY MAKING EXPLORATION ENGAGING, SOCIAL, AND VISUALLY IMMERSIVE. THE PROJECT ALSO SERVED AS AN OPPORTUNITY TO COMBINE MULTIPLE TECHNOLOGIES (FLUTTER + UNITY + GEOLOCATION SERVICES) INTO ONE COHESIVE PRODUCT AND TO EXPLORE HOW HYBRID SYSTEMS CAN DELIVER BOTH PERFORMANCE AND USABILITY.'**
  String get travelerProjectReason;

  /// No description provided for @travelerFeature1.
  ///
  /// In en, this message translates to:
  /// **'REAL-TIME LOCATION TRACKING AND VISUALIZATION'**
  String get travelerFeature1;

  /// No description provided for @travelerFeature2.
  ///
  /// In en, this message translates to:
  /// **'3D WORLD GENERATION'**
  String get travelerFeature2;

  /// No description provided for @travelerFeature3.
  ///
  /// In en, this message translates to:
  /// **'INTEGRATION OF OPENSTREETMAP DATA'**
  String get travelerFeature3;

  /// No description provided for @travelerFeature4.
  ///
  /// In en, this message translates to:
  /// **'SOCIAL INTERACTION THROUGH SHARED LOCATIONS'**
  String get travelerFeature4;

  /// No description provided for @travelerFeature5.
  ///
  /// In en, this message translates to:
  /// **'CROSS-PLATFORM MOBILE UI BUILT WITH FLUTTER'**
  String get travelerFeature5;

  /// No description provided for @travelerChallenge1.
  ///
  /// In en, this message translates to:
  /// **'INTEGRATING UNITY WITH FLUTTER IN A PERFORMANT WAY'**
  String get travelerChallenge1;

  /// No description provided for @travelerChallenge2.
  ///
  /// In en, this message translates to:
  /// **'HANDLING REAL-TIME GEOLOCATION UPDATES EFFICIENTLY'**
  String get travelerChallenge2;

  /// No description provided for @travelerChallenge3.
  ///
  /// In en, this message translates to:
  /// **'RENDERING LARGE MAP DATASETS WITHOUT PERFORMANCE DROPS'**
  String get travelerChallenge3;

  /// No description provided for @travelerChallenge4.
  ///
  /// In en, this message translates to:
  /// **'SYNCHRONIZING USER POSITIONS IN REAL TIME'**
  String get travelerChallenge4;

  /// No description provided for @travelerLearning1.
  ///
  /// In en, this message translates to:
  /// **'COMBINING FLUTTER AND UNITY IN A SINGLE APPLICATION'**
  String get travelerLearning1;

  /// No description provided for @travelerLearning2.
  ///
  /// In en, this message translates to:
  /// **'WORKING WITH GEOSPATIAL DATA AND MAP APIS'**
  String get travelerLearning2;

  /// No description provided for @travelerLearning3.
  ///
  /// In en, this message translates to:
  /// **'OPTIMIZING PERFORMANCE IN REAL-TIME SYSTEMS'**
  String get travelerLearning3;

  /// No description provided for @travelerLearning4.
  ///
  /// In en, this message translates to:
  /// **'DESIGNING EXPERIENCES THAT BRIDGE DIGITAL AND PHYSICAL INTERACTION'**
  String get travelerLearning4;

  /// No description provided for @travelerRemakeShortDescription.
  ///
  /// In en, this message translates to:
  /// **'A COMPLETE REBUILD OF TRAVELER WITH MODERN ARCHITECTURE, IMPROVED PERFORMANCE, AND A FOCUS ON DELIVERING A PRODUCTION-READY MOBILE EXPERIENCE.'**
  String get travelerRemakeShortDescription;

  /// No description provided for @travelerRemakeCatchPhrase.
  ///
  /// In en, this message translates to:
  /// **'REBUILDING THE FUTURE OF EXPLORATION'**
  String get travelerRemakeCatchPhrase;

  /// No description provided for @travelerRemakeLongDescription.
  ///
  /// In en, this message translates to:
  /// **'TRAVELER REMAKE REPRESENTS THE NEXT EVOLUTION OF MY ORIGINAL BACHELOR THESIS PROJECT. WHILE THE FIRST VERSION PROVED the feasibility of combining geolocation, social interaction, and immersive map visualization, the remake focuses on transforming that concept into a scalable and production-ready application. The entire system is being rebuilt from the ground up using modern Flutter architecture, improved state management, and a significantly enhanced user experience. Special attention is given to maintainability, responsiveness, and creating a polished mobile-first product that can grow beyond its academic origins.'**
  String get travelerRemakeLongDescription;

  /// No description provided for @travelerRemakeProjectReason.
  ///
  /// In en, this message translates to:
  /// **'THE ORIGINAL TRAVELER PROJECT UTILIZED UNITY FOR ITS 3D VISUALIZATION LAYER. WHILE THIS APPROACH SUCCESSFULLY DEMONSTRATED THE CONCEPT, IT INTRODUCED PERFORMANCE LIMITATIONS ON MOBILE DEVICES AND INCREASED THE COMPLEXITY OF THE APPLICATION. TRAVELER REMAKE IS BEING DEVELOPED AS A COMPLETE REIMPLEMENTATION WITH A STRONG EMPHASIS ON PERFORMANCE, SCALABILITY, AND USER EXPERIENCE. THE GOAL IS TO CREATE A FAST, SMOOTH, AND RELIABLE APPLICATION THAT FEELS LIKE A REAL PRODUCT RATHER THAN A PROTOTYPE.'**
  String get travelerRemakeProjectReason;

  /// No description provided for @travelerRemakeFeature1.
  ///
  /// In en, this message translates to:
  /// **'COMPLETELY REDESIGNED USER INTERFACE AND USER EXPERIENCE'**
  String get travelerRemakeFeature1;

  /// No description provided for @travelerRemakeFeature2.
  ///
  /// In en, this message translates to:
  /// **'MODERN AND SCALABLE FLUTTER ARCHITECTURE'**
  String get travelerRemakeFeature2;

  /// No description provided for @travelerRemakeFeature3.
  ///
  /// In en, this message translates to:
  /// **'OPTIMIZED MAP AND LOCATION VISUALIZATION'**
  String get travelerRemakeFeature3;

  /// No description provided for @travelerRemakeFeature4.
  ///
  /// In en, this message translates to:
  /// **'SOCIAL FEATURES FOR CONNECTING TRAVELERS'**
  String get travelerRemakeFeature4;

  /// No description provided for @travelerRemakeFeature5.
  ///
  /// In en, this message translates to:
  /// **'PERFORMANCE-FOCUSED MOBILE DEVELOPMENT'**
  String get travelerRemakeFeature5;

  /// No description provided for @travelerRemakeChallenge1.
  ///
  /// In en, this message translates to:
  /// **'TRANSFORMING A PROTOTYPE INTO A PRODUCTION-READY APPLICATION'**
  String get travelerRemakeChallenge1;

  /// No description provided for @travelerRemakeChallenge2.
  ///
  /// In en, this message translates to:
  /// **'OPTIMIZING PERFORMANCE AND RESOURCE USAGE'**
  String get travelerRemakeChallenge2;

  /// No description provided for @travelerRemakeChallenge3.
  ///
  /// In en, this message translates to:
  /// **'BUILDING A CLEAN AND MAINTAINABLE SOFTWARE ARCHITECTURE'**
  String get travelerRemakeChallenge3;

  /// No description provided for @travelerRemakeChallenge4.
  ///
  /// In en, this message translates to:
  /// **'REDESIGNING THE USER EXPERIENCE FOR REAL-WORLD USAGE'**
  String get travelerRemakeChallenge4;

  /// No description provided for @travelerRemakeLearning1.
  ///
  /// In en, this message translates to:
  /// **'ADVANCED FLUTTER ARCHITECTURE AND CLEAN CODE PRACTICES'**
  String get travelerRemakeLearning1;

  /// No description provided for @travelerRemakeLearning2.
  ///
  /// In en, this message translates to:
  /// **'MOBILE PERFORMANCE OPTIMIZATION'**
  String get travelerRemakeLearning2;

  /// No description provided for @travelerRemakeLearning3.
  ///
  /// In en, this message translates to:
  /// **'SCALABLE APPLICATION DESIGN AND STATE MANAGEMENT'**
  String get travelerRemakeLearning3;

  /// No description provided for @travelerRemakeLearning4.
  ///
  /// In en, this message translates to:
  /// **'TRANSFORMING AN ACADEMIC PROJECT INTO A REAL PRODUCT'**
  String get travelerRemakeLearning4;

  /// No description provided for @travelerRemakeAbout.
  ///
  /// In en, this message translates to:
  /// **'TRAVELER REMAKE IS CURRENTLY A WORK IN PROGRESS. THE OBJECTIVE IS TO EVOLVE THE ORIGINAL BACHELOR THESIS INTO A FULLY FUNCTIONAL APPLICATION THAT IS FAST, SCALABLE, AND SUITABLE FOR EVERYDAY USE. IN CONTRAST TO THE ORIGINAL PROTOTYPE, THE REMAKE MOVES AWAY FROM UNITY-BASED RENDERING TO EXPLORE MORE EFFICIENT APPROACHES THAT BETTER FIT MOBILE DEVICES. THE FOCUS IS ON PERFORMANCE, MODERN UI/UX DESIGN, CLEAN SOFTWARE ARCHITECTURE, AND DELIVERING A HIGH-QUALITY USER EXPERIENCE. THIS PROJECT DOCUMENTS THE JOURNEY OF TRANSFORMING A RESEARCH PROTOTYPE INTO A REAL-WORLD PRODUCT.'**
  String get travelerRemakeAbout;

  /// No description provided for @travelerAbout.
  ///
  /// In en, this message translates to:
  /// **'TRAVELER IS A PROJECT FOCUSED ON BRINGING DIGITAL INTERACTION INTO THE REAL WORLD. INSTEAD OF ISOLATING USERS, IT ENCOURAGES EXPLORATION, MOVEMENT, AND SHARED EXPERIENCES THROUGH IMMERSIVE 3D VISUALIZATION.'**
  String get travelerAbout;

  /// No description provided for @forestShortDescription.
  ///
  /// In en, this message translates to:
  /// **'A SMART FOREST MANAGEMENT PLATFORM FOR MONITORING SENSORS, ENVIRONMENTAL DATA, AND ACTIVITIES IN REAL TIME.'**
  String get forestShortDescription;

  /// No description provided for @forestCatchPhrase.
  ///
  /// In en, this message translates to:
  /// **'SMART FOREST MONITORING MADE SIMPLE'**
  String get forestCatchPhrase;

  /// No description provided for @forestLongDescription.
  ///
  /// In en, this message translates to:
  /// **'FOREST WAS DEVELOPED TO SUPPORT THE DIGITALIZATION AND MONITORING OF FOREST AREAS. THE APPLICATION COMBINES SENSOR TECHNOLOGY, GEOLOCATION, AND REAL-TIME DATA INTO A CENTRALIZED PLATFORM. THROUGH AN INTERACTIVE MAP, USERS CAN PLACE, MANAGE, AND MONITOR SENSORS ACROSS THE FOREST WHILE ACCESSING INFORMATION SUCH AS TEMPERATURE, BATTERY STATUS, AND GPS LOCATION. IN ADDITION, THE SYSTEM ENABLES THE MONITORING OF DESIGNATED AREAS WHERE CAMERAS TRACK CURRENT VISITOR ACTIVITY. BY INTEGRATING GOOGLE MAPS, WEATHER DATA, AND SENSOR INFORMATION, FOREST PROVIDES A COMPREHENSIVE TOOL FOR ANALYZING AND MANAGING MODERN FOREST ENVIRONMENTS.'**
  String get forestLongDescription;

  /// No description provided for @forestProjectReason.
  ///
  /// In en, this message translates to:
  /// **'THE MOTIVATION BEHIND FOREST WAS TO EXPLORE HOW DIGITAL TECHNOLOGIES CAN IMPROVE THE MANAGEMENT AND MONITORING OF FOREST ENVIRONMENTS. BY COMBINING SENSOR NETWORKS, GEOLOCATION SERVICES, AND VISUAL DATA REPRESENTATION, THE PROJECT AIMED TO CREATE A SYSTEM THAT CENTRALIZES ENVIRONMENTAL DATA AND SUPPORTS MORE INFORMED DECISION-MAKING.'**
  String get forestProjectReason;

  /// No description provided for @forestFeature1.
  ///
  /// In en, this message translates to:
  /// **'MANAGEMENT AND MONITORING OF FOREST SENSORS'**
  String get forestFeature1;

  /// No description provided for @forestFeature2.
  ///
  /// In en, this message translates to:
  /// **'REAL-TIME VISUALIZATION OF TEMPERATURE AND BATTERY DATA'**
  String get forestFeature2;

  /// No description provided for @forestFeature3.
  ///
  /// In en, this message translates to:
  /// **'GPS-BASED LOCATION TRACKING WITH GOOGLE MAPS'**
  String get forestFeature3;

  /// No description provided for @forestFeature4.
  ///
  /// In en, this message translates to:
  /// **'AREA MONITORING WITH VISITOR ANALYTICS'**
  String get forestFeature4;

  /// No description provided for @forestFeature5.
  ///
  /// In en, this message translates to:
  /// **'INTEGRATION OF WEATHER AND ENVIRONMENTAL DATA'**
  String get forestFeature5;

  /// No description provided for @forestChallenge1.
  ///
  /// In en, this message translates to:
  /// **'INTEGRATING REAL-TIME SENSOR DATA INTO A MOBILE APPLICATION'**
  String get forestChallenge1;

  /// No description provided for @forestChallenge2.
  ///
  /// In en, this message translates to:
  /// **'MANAGING AND VISUALIZING LARGE NUMBERS OF SENSOR LOCATIONS'**
  String get forestChallenge2;

  /// No description provided for @forestChallenge3.
  ///
  /// In en, this message translates to:
  /// **'CONNECTING GOOGLE MAPS WITH DYNAMIC DATA SOURCES'**
  String get forestChallenge3;

  /// No description provided for @forestChallenge4.
  ///
  /// In en, this message translates to:
  /// **'PRESENTING COMPLEX ENVIRONMENTAL DATA THROUGH AN INTUITIVE USER INTERFACE'**
  String get forestChallenge4;

  /// No description provided for @forestLearning1.
  ///
  /// In en, this message translates to:
  /// **'WORKING WITH GEOLOCATION SERVICES AND MAPPING TECHNOLOGIES'**
  String get forestLearning1;

  /// No description provided for @forestLearning2.
  ///
  /// In en, this message translates to:
  /// **'INTEGRATING AND VISUALIZING SENSOR NETWORKS'**
  String get forestLearning2;

  /// No description provided for @forestLearning3.
  ///
  /// In en, this message translates to:
  /// **'BUILDING DATA-DRIVEN FLUTTER APPLICATIONS'**
  String get forestLearning3;

  /// No description provided for @forestLearning4.
  ///
  /// In en, this message translates to:
  /// **'DESIGNING USER-FRIENDLY DASHBOARDS FOR REAL-TIME DATA'**
  String get forestLearning4;

  /// No description provided for @forestAbout.
  ///
  /// In en, this message translates to:
  /// **'FOREST IS A MOBILE APPLICATION DESIGNED TO DIGITALLY MONITOR AND MANAGE FOREST ENVIRONMENTS. BY COMBINING SENSOR TECHNOLOGY, GOOGLE MAPS, WEATHER DATA, AND VISUAL ANALYTICS, IT PROVIDES A CENTRALIZED PLATFORM FOR SMART, DATA-DRIVEN FOREST MANAGEMENT.'**
  String get forestAbout;

  /// No description provided for @searchProjects.
  ///
  /// In en, this message translates to:
  /// **'SEARCH PROJECTS'**
  String get searchProjects;

  /// No description provided for @aboutProject.
  ///
  /// In en, this message translates to:
  /// **'ABOUT THE PROJECT'**
  String get aboutProject;

  /// No description provided for @projectShowcaseGallery.
  ///
  /// In en, this message translates to:
  /// **'PROJECT SHOWCASE GALLERY'**
  String get projectShowcaseGallery;

  /// No description provided for @technologiesPlatform.
  ///
  /// In en, this message translates to:
  /// **'TECHNOLOGIES AND PLATFORM'**
  String get technologiesPlatform;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'DESCRIPTION'**
  String get description;

  /// No description provided for @roleAndContribution.
  ///
  /// In en, this message translates to:
  /// **'ROLE AND CONTRIBUTION'**
  String get roleAndContribution;

  /// No description provided for @outcome.
  ///
  /// In en, this message translates to:
  /// **'OUTCOME'**
  String get outcome;

  /// No description provided for @timePeriod.
  ///
  /// In en, this message translates to:
  /// **'TIME PERIOD'**
  String get timePeriod;

  /// No description provided for @learnings.
  ///
  /// In en, this message translates to:
  /// **'LEARNINGS'**
  String get learnings;

  /// No description provided for @challenges.
  ///
  /// In en, this message translates to:
  /// **'CHALLENGES'**
  String get challenges;

  /// No description provided for @softwareProjects.
  ///
  /// In en, this message translates to:
  /// **'SOFTWARE PROJECTS'**
  String get softwareProjects;

  /// No description provided for @travelerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TURN EVERY WALK INTO AN ADVENTURE.'**
  String get travelerSubtitle;
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
