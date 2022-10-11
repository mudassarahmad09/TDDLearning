import Foundation

class AppModel {
  static let instance = AppModel()

  var appState: AppState = .notStarted
  let dataModel = DataModel()

  func start() throws{
    guard dataModel.goal != nil else {
      throw AppError.goalNotSet
    }
    appState = .inProgress
  }
  func restart() {
    appState = .notStarted
  }
}
