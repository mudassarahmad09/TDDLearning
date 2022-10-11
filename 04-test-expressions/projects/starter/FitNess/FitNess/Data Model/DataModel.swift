import Foundation

// Add the Data Model class here:

class DataModel{
  
  var goal: Int?
  var steps: Int = 0
  let nessie = Nessie()
  var distance: Double = 0
  
  var goalReached: Bool {
    if let goal = goal,
      steps >= goal, !caught {
        return true
    }
    return false
  }
  var caught: Bool {
    return distance > 0 && nessie.distance >= distance
  }
}
