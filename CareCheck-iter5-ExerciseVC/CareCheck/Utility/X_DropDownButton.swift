
import UIKit

protocol DropDownProtocol {
  
  func dropDownPressed (string: String)
}


class DropDownButton : UIButton,
                       DropDownProtocol{
  
  var dropView = DropDownView()
  
  var height = NSLayoutConstraint()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.clear
    
    dropView = DropDownView.init(frame: CGRect(x: 0,
                                               y: 0,
                                               width: 0,
                                               height: 0))
    dropView.delegate = self
    dropView.translatesAutoresizingMaskIntoConstraints = false
    
  }
  
  
  func dropDownPressed(string: String) {
    self.setTitle(string,
                  for: .normal)
    self.dismissDropDown()
  }
  
  
  override func didMoveToSuperview() {
    
    self.superview?.addSubview(dropView)
    self.superview?.bringSubviewToFront(dropView)
    
    dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    height = dropView.heightAnchor.constraint(equalToConstant: 0)
  }
  
  
  var isOpen = false
  
  override func touchesBegan(_ touches: Set<UITouch>,
                             with event: UIEvent?) {
    if isOpen == false {
      
      isOpen = true
      NSLayoutConstraint.deactivate([self.height])
      
      if self.dropView.tableView.contentSize.height > 150 {
        self.height.constant = 150
      } else {
        self.dropView.center.y = self.dropView.tableView.contentSize.height
      }
      
      NSLayoutConstraint.activate([self.height])
      
      UIView.animate(withDuration: 0.5,
                     delay: 0,
                     usingSpringWithDamping: 0.5,
                     initialSpringVelocity: 0.5,
                     options: .showHideTransitionViews,
                     animations: {
        self.dropView.layoutIfNeeded()
        self.dropView.center.y += self.dropView.frame.height / 2
        
      },
                     completion: nil)
    }else{
      
      isOpen = false
      NSLayoutConstraint.deactivate([self.height])
      self.height.constant = 0
      NSLayoutConstraint.activate([self.height])
      
      UIView.animate(withDuration: 0,
                     delay: 0,
                     usingSpringWithDamping: 0,
                     initialSpringVelocity: 0,
                     options: .showHideTransitionViews,
                     animations: {
        self.dropView.center.y -= self.dropView.frame.height / 2
        self.dropView.layoutIfNeeded()
        
      },
                     completion: nil)
    }
  }
  
  
  func dismissDropDown() {
    isOpen = false
    NSLayoutConstraint.deactivate([self.height])
    self.height.constant = 0
    NSLayoutConstraint.activate([self.height])
    
    UIView.animate(withDuration: 0.5,
                   delay: 0,
                   usingSpringWithDamping: 0.5,
                   initialSpringVelocity: 0.5,
                   options: .curveEaseInOut,
                   animations: {
      self.dropView.center.y -= self.dropView.frame.height / 2
      self.dropView.layoutIfNeeded()
      
    },
                   completion: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}





class DropDownView: UIView,
                    UITableViewDelegate,
                    UITableViewDataSource {
  
  var delegate : DropDownProtocol!
  
  var dropDownOptions = [String]()
  
  var tableView = UITableView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    tableView.backgroundColor = UIColor.clear
    self.backgroundColor = UIColor.white
    
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(tableView)
    
    tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return dropDownOptions.count
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = UITableViewCell()
    cell.backgroundColor = UIColor.clear
    
    cell.textLabel?.text = dropDownOptions[indexPath.row]
    cell.textLabel?.textColor = .black
    
    return cell
    
  }
  
  
  func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath) {
    self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
//    self.tableView.deselectRow(at: indexPath,
//                               animated: true)
  }
  
}
