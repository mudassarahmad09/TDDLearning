
import XCTest
@testable import FitNess

class StepCountControllerTests: XCTestCase {
  //swiftlint:disable implicitly_unwrapped_optional
  var sut: StepCountController!

  override func setUpWithError() throws {
    try super.setUpWithError()
    let rootController = getRootViewController()
    sut = rootController.stepController
  }

  override func tearDownWithError() throws {
    AppModel.instance.dataModel.goal = nil
    AppModel.instance.restart()
    sut.updateUI()
    try super.tearDownWithError()
  }

  // MARK: - Given
  func givenInProgress() {
    givenGoalSet()
    sut.startStopPause(nil)
  }
  
  func givenGoalSet() {
    AppModel.instance.dataModel.goal = 1000
  }
  // MARK: - When
  private func whenStartStopPauseCalled() {
    sut.startStopPause(nil)
  }

  // MARK: - Initial State

  func testController_whenCreated_buttonLabelIsStart() {

    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
  }

 
  // MARK: - In Progress

  func testController_whenStartTapped_appIsInProgress() {
    // when
    givenGoalSet()
    whenStartStopPauseCalled()

    // then
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
  }

  func testController_whenStartTapped_buttonLabelIsPause() {
    // when
    givenGoalSet()
    whenStartStopPauseCalled()

    // then
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }

  func testDataModel_whenGoalUpdate_updatesNewGoals(){
    
    sut.updateGoal(newGoal: 10)
  
    XCTAssertEqual(AppModel.instance.dataModel.goal, 10)
  }
  // MARK: - Chase View
  func testChaseView_whenLoaded_isNotStarted() {
    let chaseView = sut.chaseView
    
    XCTAssertEqual(chaseView?.state, .notStarted)
    
  }
  func testChaseView_whenInProgress_viewIsInProgress() {
    // given
    givenInProgress()

    // then
    let chaseView = sut.chaseView
    XCTAssertEqual(chaseView?.state, .inProgress)
  }
}
