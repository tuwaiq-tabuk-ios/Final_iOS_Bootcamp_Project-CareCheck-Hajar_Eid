

import UIKit
import Firebase

class PreviewViewController: UIViewController {
  
  @IBOutlet weak var skipButton: UIButton!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    checkUserIsSignedIn()

  }
  
  
  func checkUserIsSignedIn(){
    Auth.auth().addStateDidChangeListener{(auth,user)in
      if user != nil
      {
        let viewController =
              self.storyboard?.instantiateViewController(
                withIdentifier: "welcomeViewID") as! UITabBarController
        
              viewController.modalTransitionStyle = .crossDissolve
              viewController.modalPresentationStyle = .overFullScreen
        
              self.present(viewController,
                           animated: true,
                           completion: nil)
      }
    }
  }
  
  
  @IBAction func skipButtonPressed(_ sender: UIButton) {
    
    self.performSegue(withIdentifier: "goToSignInScreen",
                      sender: nil)
  }
  
}


