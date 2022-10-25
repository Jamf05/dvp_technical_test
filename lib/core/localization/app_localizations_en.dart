import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutApp => 'Acerca de';

  @override
  String get version => 'Versión';

  @override
  String get appCreatedAt => 'dvp_technical_test, 2020';

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
  String get homeTitle => '¡Hola';

  @override
  String get homeSubtitle => 'Bienvenido de vuelta, cuéntanos, ¿Qué vamos a hacer hoy?';

  @override
  String get endsAt => 'Finaliza a las';

  @override
  String get startAt => 'Inicia a las';
}
