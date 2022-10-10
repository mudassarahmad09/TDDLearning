import Foundation

class AppModel {
  static let instance = AppModel()

  var appState: AppState = .notStarted

  func start() {
    appState = .inProgress
  }
}
