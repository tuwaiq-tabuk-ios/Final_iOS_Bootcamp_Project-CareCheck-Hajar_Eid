

import UIKit
import Firebase

class SignUpViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var signUpButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  @IBAction func signUpButtonPressed(_ sender: UIButton) {
    
    Auth.auth().createUser(withEmail: emailTextField.text!,
                           password: passwordTextField.text!) {
      (authResult, error) in
      
      if error != nil {
        self.present(
          Service.createAlertController(title: "Error",
                                        message: error!.localizedDescription),
//          Service.createAlertController(title: "Error",
//                                        message: "ERROR: Wrong passwword"),
          animated: true,
          completion: nil)
        return
      }
    }
    self.performSegue(withIdentifier: "userSignedUpSegue",
                      sender: nil)
  }
}



