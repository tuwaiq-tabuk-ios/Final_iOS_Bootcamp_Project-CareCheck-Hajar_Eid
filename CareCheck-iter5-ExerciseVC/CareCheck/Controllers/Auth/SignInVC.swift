

import UIKit
import Firebase

class SignInViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var signInButton: UIButton!
  @IBOutlet weak var forgetPasswordButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  @IBAction func signInButtonPressed(_ sender: UIButton) {
    
    Auth.auth().signIn(withEmail: emailTextField.text!,
                       password: passwordTextField.text!) {
      
      (authResult, error) in
      if error != nil {
        
        self.present(
          Service.createAlertController(
            title: "Error",
            message: error!.localizedDescription),
          animated: true,
          completion: nil)
        
        return
      }
      
      self.performSegue(withIdentifier: "userSignedInSegue",
                        sender: nil)
    }
  }
  
  
  @IBAction func forgetPasswordButtonPressed(_ sender: UIButton) {
    self.performSegue(withIdentifier: "forgetPasswordSegue",
                      sender: nil)
    
  }
  
}


