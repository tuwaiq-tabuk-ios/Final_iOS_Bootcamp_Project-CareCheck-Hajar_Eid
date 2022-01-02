
import UIKit
import Firebase

class ForgetPasswordViewController: UIViewController {
  
  @IBOutlet weak var emailTextFiled: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  
  @IBAction func sendAnEmailButtonPressed(_ sender: UIButton) {
    Auth.auth().sendPasswordReset(withEmail: emailTextFiled.text!) { (error) in
      if let error = error {
        let alert = Service.createAlertController(title: "Error",
                                                  message: error.localizedDescription)
        self.present(alert,
                     animated: true,
                     completion: nil)
        return
      }
      
      let alert = Service.createAlertController(title: "Password Reset",
                                                message: "An email has sent to you with a link to reset your password")
      self.present(alert,
                   animated: true,
                   completion: nil)
    }
  }
}
