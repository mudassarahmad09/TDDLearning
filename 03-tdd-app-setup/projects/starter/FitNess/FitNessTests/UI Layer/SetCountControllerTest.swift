

import XCTest
@testable import FitNess

final class SetCountControllerTest: XCTestCase {

  var sut: StepCountController!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = StepCountController()
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  // MARK: - Initial State

  func testController_whenCreated_buttonLabelIsStart() {
    sut.viewDidLoad()
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
  }
  
  // MARK: - In Progress
  
  func testSetCountController_whenStartTaped_appsInProgess(){
    
    whenStartStopPauseCalled()
    
    let observer = AppModel.instance.appState
    
    XCTAssertEqual(observer, AppState.inProgress)
  }
  
  func testSetCountController_whenStartTaped_buttonLabelIsPause(){
    whenStartStopPauseCalled()
    
    let text = AppModel.instance.appState.nextStateButtonLabel
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }
  
  // MARK: - When
  private func whenStartStopPauseCalled() {
    sut.startStopPause(nil)
  }
}
