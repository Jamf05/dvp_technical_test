import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutApp => 'Acerca de';

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
  String get save => 'Guardar';

  @override
  String get invalidDate => 'No puede seleccionar una fecha menor a la actual';

  @override
  String get close => 'Cerrar';

  @override
  String get invalidTime => 'No puede seleccionar una hora menor a la actual';

  @override
  String get invalidTimeInterval => 'La hora final no puede ser menor que la inicial';

  @override
  String get helloWord => 'Hola';

  @override
  String get homeText1 => 'Bienvenido de vuelta, cuéntame un poco sobre ti';

  @override
  String get endsAt => 'Finaliza a las';

  @override
  String get startAt => 'Inicia a las';

  @override
  String get invalidFieldWord => 'Campo invalido';

  @override
  String get nameWord => 'Nombre';

  @override
  String get surnameWord => 'Apellido';

  @override
  String get birthdayWord => 'Fecha de nacimiento';

  @override
  String get addressWord => 'Dirección';
}
