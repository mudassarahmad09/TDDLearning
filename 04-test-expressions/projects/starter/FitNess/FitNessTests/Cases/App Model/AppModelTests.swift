
import XCTest
@testable import FitNess

class AppModelTests: XCTestCase {
  //swiftlint:disable implicitly_unwrapped_optional
  var sut: AppModel!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = AppModel()
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  // MARK: - Given
  func givenGoalSet() {
    sut.dataModel.goal = 1000
  }
  func givenInProgress() {
    givenGoalSet()
    try! sut.start()
  }
  // MARK: - Lifecycle
  func testAppModel_whenInitialized_isInNotStartedState() {
    let initialState = sut.appState
    XCTAssertEqual(initialState, AppState.notStarted)
  }
  func testModelWithNoGoal_whenStarted_throwsError() {
    
    XCTAssertThrowsError(try sut.start())
  }
  func testStart_withGoalSet_doesNotThrow() {
    // given
    givenGoalSet()

    // then
    XCTAssertNoThrow(try sut.start())
  }
  // MARK: - Start
  func testAppModel_whenStarted_isInInProgressState() {
    // when started
    givenGoalSet()
    try? sut.start()

    // then it is in inProgress
    let observedState = sut.appState
    XCTAssertEqual(observedState, .inProgress)
  }
  func testAppModel_whenReset_isInNotStartedState() {
    // given
    givenInProgress()

    // when
    sut.restart()

    // then
    XCTAssertEqual(sut.appState, .notStarted)
  }
}
