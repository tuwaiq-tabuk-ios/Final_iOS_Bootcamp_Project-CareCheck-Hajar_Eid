

import UIKit
import Firebase

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var signOutButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  @IBAction func signOutButtonPressed(_ sender: UIButton) {
    
    do{
      try Auth.auth().signOut()
    }
    
    catch let signOutError {
      self.present(
        Service.createAlertController(
          title: "Error",
          message:signOutError.localizedDescription),
        animated: true,
        completion: nil)
    }
    let viewController =
          self.storyboard?.instantiateViewController(
            withIdentifier: "signInViewID") as! UINavigationController
    
          viewController.modalTransitionStyle = .crossDissolve
          viewController.modalPresentationStyle = .overFullScreen
    
          self.present(viewController,
                       animated: true,
                       completion: nil)
  }
  
  
}


