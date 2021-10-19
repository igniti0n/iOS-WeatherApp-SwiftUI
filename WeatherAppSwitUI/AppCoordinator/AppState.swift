//
//  AppState.swift
//  BezvezeSwiftUIEksperimentiranje
//
//  Created by Ivan Stajcer on 13.10.2021..
//

import Foundation
import Combine

enum AppState {
  case onboarding
  case userNotAuthenitcated
  case userAuthenticated(User)
}
 
final class AppStateProvider {
  let subject = CurrentValueSubject<AppState, Error>(.userNotAuthenitcated)
  static let instance = AppStateProvider()
}

// MARK: - Public functions
extension AppStateProvider {
  func authenticate() {
    subject.send(.onboarding)
  }
  
  func singOut() {
    subject.send(.userNotAuthenitcated)
  }
  
  func finishOnboarding() {
    subject.send(.userAuthenticated(User(id: UUID.init().uuidString, name: "Ivica")))
  }
}
