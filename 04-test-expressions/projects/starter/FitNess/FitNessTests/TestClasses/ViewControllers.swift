
import UIKit
@testable import FitNess

func getRootViewController() -> RootViewController {
  guard let controller =
      (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
      .windows
      .first?
      .rootViewController as? RootViewController else {
      assert(false, "Did not a get RootViewController")
    }
    return controller
}
func getStepCountController() ->  StepCountController{
  let storyboard = UIStoryboard(name: "Main", bundle: nil)
  return storyboard.instantiateViewController(withIdentifier: "stepController") as! StepCountController
  
}
