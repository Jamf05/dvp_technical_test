import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutApp => 'About';

  @override
  String get version => 'Versión';

  @override
  String get appCreatedAt => '2022';

  @override
  String get dateSelectionTitle => ', qué buena elección';

  @override
  String get dateSelectionSubtitle => 'Ahora selecciona cuándo será tu reunión y filtraremos los chef disponibles.';

  @override
  String get selectATime => 'Selecciona un horario';

  @override
  String get saveWord => 'Save';

  @override
  String get invalidDate => 'No puede seleccionar una fecha menor a la actual';

  @override
  String get closeWord => 'Close';

  @override
  String get invalidTime => 'No puede seleccionar una hora menor a la actual';

  @override
  String get invalidTimeInterval => 'La hora final no puede ser menor que la inicial';

  @override
  String get helloWord => 'Hello!';

  @override
  String get homeText1 => 'Welcome back, tell me a little about yourself';

  @override
  String get endsAt => 'Finaliza a las';

  @override
  String get startAt => 'Inicia a las';

  @override
  String get invalidFieldWord => 'Invalid field';

  @override
  String get nameWord => 'Name';

  @override
  String get surnameWord => 'Surname';

  @override
  String get birthdayWord => 'Birthday';

  @override
  String get addressWord => 'Address';

  @override
  String get createWord => 'Create';

  @override
  String get editWord => 'Edit';

  @override
  String get deleteWord => 'Delete';

  @override
  String get confirmDeleteAddressPhrase => 'Are you sure?';

  @override
  String get yesWord => 'Yes';

  @override
  String get noWord => 'No';

  @override
  String get newAddressWord => 'New address';

  @override
  String get homePageSuccessNotification1 => 'Your data has been successfully updated';

  @override
  String get addressListPageTitle => 'My addresses';

  @override
  String get addressListPageEmpty1 => 'You have not yet added\nyour address.';
}
