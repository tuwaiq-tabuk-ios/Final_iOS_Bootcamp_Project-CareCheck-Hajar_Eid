
import Foundation
import UIKit

class CheckBoxButton : UIButton{
  
  let checkImage = UIImage(named: "checkBoxChecked")! as UIImage
  let unCheckedImage = UIImage(named: "checkBoxUnchecked")! as UIImage
  
  var isChecked: Bool = false {
    
    didSet {
      if isChecked == true {
        self.setImage(unCheckedImage,
                      for: .normal)
      } else {
        self.setImage(checkImage,
                      for: .normal)
      }
    }
  }
 
    
  override func awakeFromNib() {
    self.isUserInteractionEnabled = true
    self.addTarget(self,
                   action: #selector(CheckBoxButton.buttonChecked(sender:)),
                   for: .touchUpInside)
    self.isChecked = false
  }
  
  
  @objc func buttonChecked(sender: UIButton){
    if sender == self {
      if isChecked == true{
        isChecked = false
      } else {
        isChecked = true
      }
    }
  }
   
}
