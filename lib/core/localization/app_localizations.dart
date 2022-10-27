import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @aboutApp.
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get aboutApp;

  /// No description provided for @version.
  ///
  /// In es, this message translates to:
  /// **'Versión'**
  String get version;

  /// No description provided for @appCreatedAt.
  ///
  /// In es, this message translates to:
  /// **'2022'**
  String get appCreatedAt;

  /// No description provided for @dateSelectionTitle.
  ///
  /// In es, this message translates to:
  /// **', qué buena elección'**
  String get dateSelectionTitle;

  /// No description provided for @dateSelectionSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Ahora selecciona cuándo será tu reunión y filtraremos los chef disponibles.'**
  String get dateSelectionSubtitle;

  /// No description provided for @selectATime.
  ///
  /// In es, this message translates to:
  /// **'Selecciona un horario'**
  String get selectATime;

  /// No description provided for @saveWord.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get saveWord;

  /// No description provided for @invalidDate.
  ///
  /// In es, this message translates to:
  /// **'No puede seleccionar una fecha menor a la actual'**
  String get invalidDate;

  /// No description provided for @closeWord.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get closeWord;

  /// No description provided for @invalidTime.
  ///
  /// In es, this message translates to:
  /// **'No puede seleccionar una hora menor a la actual'**
  String get invalidTime;

  /// No description provided for @invalidTimeInterval.
  ///
  /// In es, this message translates to:
  /// **'La hora final no puede ser menor que la inicial'**
  String get invalidTimeInterval;

  /// No description provided for @helloWord.
  ///
  /// In es, this message translates to:
  /// **'¡Hola!'**
  String get helloWord;

  /// No description provided for @homeText1.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido de vuelta, cuéntame un poco sobre ti'**
  String get homeText1;

  /// No description provided for @endsAt.
  ///
  /// In es, this message translates to:
  /// **'Finaliza a las'**
  String get endsAt;

  /// No description provided for @startAt.
  ///
  /// In es, this message translates to:
  /// **'Inicia a las'**
  String get startAt;

  /// No description provided for @invalidFieldWord.
  ///
  /// In es, this message translates to:
  /// **'Campo invalido'**
  String get invalidFieldWord;

  /// No description provided for @nameWord.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get nameWord;

  /// No description provided for @surnameWord.
  ///
  /// In es, this message translates to:
  /// **'Apellido'**
  String get surnameWord;

  /// No description provided for @birthdayWord.
  ///
  /// In es, this message translates to:
  /// **'Fecha de nacimiento'**
  String get birthdayWord;

  /// No description provided for @addressWord.
  ///
  /// In es, this message translates to:
  /// **'Dirección'**
  String get addressWord;

  /// No description provided for @createWord.
  ///
  /// In es, this message translates to:
  /// **'Crear'**
  String get createWord;

  /// No description provided for @editWord.
  ///
  /// In es, this message translates to:
  /// **'Editar'**
  String get editWord;

  /// No description provided for @deleteWord.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get deleteWord;

  /// No description provided for @confirmDeleteAddressPhrase.
  ///
  /// In es, this message translates to:
  /// **'¿Estas seguro?'**
  String get confirmDeleteAddressPhrase;

  /// No description provided for @yesWord.
  ///
  /// In es, this message translates to:
  /// **'Si'**
  String get yesWord;

  /// No description provided for @noWord.
  ///
  /// In es, this message translates to:
  /// **'No'**
  String get noWord;

  /// No description provided for @newAddressWord.
  ///
  /// In es, this message translates to:
  /// **'Nueva dirección'**
  String get newAddressWord;

  /// No description provided for @homePageSuccessNotification1.
  ///
  /// In es, this message translates to:
  /// **'Tus datos se han actualizado correctamente'**
  String get homePageSuccessNotification1;

  /// No description provided for @addressListPageTitle.
  ///
  /// In es, this message translates to:
  /// **'Mis direcciones'**
  String get addressListPageTitle;

  /// No description provided for @addressListPageEmpty1.
  ///
  /// In es, this message translates to:
  /// **'Aún no has añadido tu\ndirección.'**
  String get addressListPageEmpty1;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
