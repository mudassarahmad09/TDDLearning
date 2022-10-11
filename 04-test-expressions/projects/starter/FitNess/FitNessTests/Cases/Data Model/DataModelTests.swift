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
}
