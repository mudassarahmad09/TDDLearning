import Foundation

// Add the Data Model class here:

class DataModel{
  
  var goal: Int?
  var steps: Int = 0
  
  var goalReached: Bool {
    if let goal = goal,
      steps >= goal {
        return true
    }
    return false
  }
}
