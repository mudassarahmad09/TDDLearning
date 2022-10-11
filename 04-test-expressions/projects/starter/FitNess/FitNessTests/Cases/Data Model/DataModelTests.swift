import XCTest
@testable import FitNess

final class DataModelTests: XCTestCase {
  var sut: DataModel!
  
    override func setUpWithError() throws {
      try super.setUpWithError()
       sut = DataModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
  
  // MARK: - Goal
  func testModel_whenStarted_goalIsNotReached() {
    XCTAssertFalse(
      sut.goalReached,
      "goalReached should be false when the model is created")
    
  }
  
  func testModel_whenStarted_goalIsReached() {
    
      sut.goal = 1000
      sut.steps = 1000
      
    XCTAssertTrue(sut.goalReached)
  }
  func testModel_whenStarted_userIsNotCaught() {
    XCTAssertFalse(sut.caught)
  }
  func testModel_whenUserAheadOfNessie_isNotCaught() {
    // given
    sut.distance = 1000
    sut.nessie.distance = 100

    // then
    XCTAssertFalse(sut.caught)
  }

  func testModel_whenNessieAheadofUser_isCaught() {
    // given
    sut.nessie.distance = 1000
    sut.distance = 100

    // then
    XCTAssertTrue(sut.caught)
  }
  func testGoal_whenUserCaught_cannotBeReached() {
    //given goal should be reached
    sut.goal = 1000
    sut.steps = 1000

    // when caught by nessie
    sut.distance = 100
    sut.nessie.distance = 100

    // then
    XCTAssertFalse(sut.goalReached)
  }

}
