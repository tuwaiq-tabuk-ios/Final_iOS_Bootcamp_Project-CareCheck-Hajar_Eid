

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var medsButton: UIButton!
  @IBOutlet weak var mealsButton: UIButton!
  @IBOutlet weak var showerButton: UIButton!
  @IBOutlet weak var photoButton: UIButton!
  
  let medsTrackShape = CAShapeLayer()
  let medsShape = CAShapeLayer()
  
  let mealsTrackShape = CAShapeLayer()
  let mealsShape = CAShapeLayer()
 
  let showerTrackShape = CAShapeLayer()
  let showerShape = CAShapeLayer()
  
  let photoTrackShape = CAShapeLayer()
  let photoShape = CAShapeLayer()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureButton()
    configureProgressBar()
    
    view.layer.addSublayer(medsTrackShape)
    view.layer.addSublayer(medsShape)
    
    view.layer.addSublayer(mealsTrackShape)
    view.layer.addSublayer(mealsShape)
    
    view.layer.addSublayer(showerTrackShape)
    view.layer.addSublayer(showerShape)
    
    view.layer.addSublayer(photoTrackShape)
    view.layer.addSublayer(photoShape)
    
    
    //for animate the progress bar
    //    let button = uibutton()
    //    view.addSubview(button)
    //    button.setTitle("Meds",
    //                    for: .normal)
    //    button.backgroundColor = .systemGray
    //    button.addTarget(self,
    //                     action: #selector(didTapButton),
    //                     for: .touchUpInside)
  }
  
  
  @objc func didTapButton(){
    //    let animation = CABasicAnimation(keyPath: "strokeEnd")
    //    animation.toValue = 1
    //    animation.duration = 3
    //    animation.isRemovedOnCompletion = false
    //    animation.fillMode = .forwards
    //    shape.add(animation,
    //              forKey: "animation")
  }
  
  
  
  
  @IBAction func medsButtonPressed(_ sender: UIButton) {
    self.performSegue(withIdentifier: "medsSegue",
                      sender: nil)
    
    
  }
  
  @IBAction func mealsButtonPressed(_ sender: UIButton) {
    self.performSegue(withIdentifier: "mealsSegue",
                      sender: nil)
  }
  
  @IBAction func showerButtonPressed(_ sender: UIButton) {
    self.performSegue(withIdentifier: "showerSegue",
                      sender: nil)
  }
  
  @IBAction func photoButtonPressed(_ sender: UIButton) {
    self.performSegue(withIdentifier: "photoSegue",
                      sender: nil)
  }
  
}

