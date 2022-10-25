/// - 0 -> enabledConfirmed
/// - 1 -> enabledWithGoogle
/// - 2 -> enabledWithFacebook
/// - 3 -> waitingToCompleteRegistration
/// - 4 -> enabledUnconfirmed
/// - 5 -> disabledConfirmed
/// - 6 -> disabledUnconfirmed
/// - 7 -> disabledByGoogle
/// - 8 -> disabledByFacebook
/// - 9 -> inactive 
/// - null or other -> unknown 
enum SessionStatus { 
  enabledConfirmed,
  enabledWithGoogle,
  enabledWithFacebook,
  waitingToCompleteRegistration,
  enabledUnconfirmed,
  disabledConfirmed,
  disabledUnconfirmed,
  disabledByGoogle,
  disabledByFacebook,
  inactive,
  unknown,
}

extension IntFromSessionStatus on SessionStatus {
  int? get value {
    Map<SessionStatus, int?> fromSessionStatus = {
      SessionStatus.enabledConfirmed: 0,
      SessionStatus.enabledWithGoogle: 1,
      SessionStatus.enabledWithFacebook: 2,
      SessionStatus.waitingToCompleteRegistration: 3,
      SessionStatus.enabledUnconfirmed: 4,
      SessionStatus.disabledConfirmed: 5,
      SessionStatus.disabledUnconfirmed: 6,
      SessionStatus.disabledByGoogle: 7,
      SessionStatus.disabledByFacebook: 8,
      SessionStatus.inactive: 9,
      SessionStatus.unknown: null,
    };
    if(fromSessionStatus.containsKey(this)) {
      return fromSessionStatus[this];
    } else {
      return null;
    }
  }
}

extension SessionStatusfromInt on int? {
  SessionStatus? get toSessionStatus {
    Map<int?, SessionStatus> fromInt = {
      0: SessionStatus.enabledConfirmed,
      1: SessionStatus.enabledWithGoogle,
      2: SessionStatus.enabledWithFacebook,
      3: SessionStatus.waitingToCompleteRegistration,
      4: SessionStatus.enabledUnconfirmed,
      5: SessionStatus.disabledConfirmed,
      6: SessionStatus.disabledUnconfirmed,
      7: SessionStatus.disabledByGoogle,
      8: SessionStatus.disabledByFacebook,
      9: SessionStatus.inactive,
      null: SessionStatus.unknown
    };
    if (fromInt.containsKey(this)) {
      return fromInt[this];
    } else {
      return SessionStatus.unknown;
    }
  }
}