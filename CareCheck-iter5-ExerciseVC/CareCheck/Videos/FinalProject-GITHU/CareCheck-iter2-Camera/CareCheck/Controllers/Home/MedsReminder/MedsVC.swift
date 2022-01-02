
import UIKit

class MedsViewController: UIViewController {
  
  //  var rowsWhichAreChecked = [NSIndexPath]()
  
  
  @IBOutlet weak var addNewCellButton: UIButton!
  
  @IBOutlet weak var medsTableView: UITableView!
  
    var model = [MyReminder]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    medsTableView.delegate = self
    medsTableView.dataSource = self
    medsTableView.allowsMultipleSelection = true
    
  }
  
  //
  //  func tableView(_ tableView: UITableView,
  //                 numberOfRowsInSection section: Int) -> Int {
  //    return model.count
  //  }
  //
  //
  //  func tableView(_ tableView: UITableView,
  //                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  //
  //    let cell = medsTableView.dequeueReusableCell(withIdentifier: "cell",
  //                                             for: indexPath) as! MedsTableViewCell
  //    cell.textLabel?.text = model[indexPath.row].title
  ////    = tableView.dequeueReusableCell(withIdentifier: "cell") as! MedsTableViewCell
  ////    cell.medNameLabel.text = self.arr[indexPath.row]
  //    let isRowChecked = rowsWhichAreChecked.contains(indexPath as NSIndexPath)
  //    if isRowChecked == true {
  //      cell.checkBoxButton.isChecked = false
  //      cell.checkBoxButton.buttonChecked(sender: cell.checkBoxButton)
  //
  //    }else {
  //      cell.checkBoxButton.isChecked = true
  //      cell.checkBoxButton.buttonChecked(sender: cell.checkBoxButton)
  //    }
  //    return cell
  //  }
  //
  //
  //  func tableView(_ tableView: UITableView,
  //                 heightForRowAt indexPath: IndexPath) -> CGFloat {
  //    return 60.00
  //  }
  //
  //
  //  func tableView(_ tableView: UITableView,
  //                 didSelectRowAt indexPath: IndexPath) {
  //
  //    medsTableView.deselectRow(at: indexPath,
  //                              animated: true)
  //    let cell = tableView.cellForRow(at: indexPath as IndexPath) as! MedsTableViewCell
  ////    cell.contentView.backgroundColor = UIColor.white
  //
  //    if (rowsWhichAreChecked.contains(indexPath as NSIndexPath) == false) {
  //      cell.checkBoxButton.isChecked = true
  //      cell.checkBoxButton.buttonChecked(sender: cell.checkBoxButton)
  //    }
  //  }
  //
  //
  //  func tableView(_ tableView: UITableView,
  //                 didDeselectRowAt indexPath: IndexPath) {
  //    let cell = tableView.cellForRow(at: indexPath as IndexPath) as! MedsTableViewCell
  //    cell.checkBoxButton.isChecked = false
  //    cell.checkBoxButton.buttonChecked(sender: cell.checkBoxButton)
  //
  //    //remove indexPath from rowsWhichAreChecked
  //    if let checkedItemIndex = rowsWhichAreChecked.firstIndex(of: indexPath as NSIndexPath){
  //      rowsWhichAreChecked.remove(at: checkedItemIndex)
  //    }
  //
  //  }
  //
  //
  //  func tableView(_ tableView: UITableView,
  //                 editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
  //    return.delete
  //  }
  //
  //
  //  func tableView(_ tableView: UITableView,
  //                 commit editingStyle: UITableViewCell.EditingStyle,
  //                 forRowAt indexPath: IndexPath) {
  //
  //    if editingStyle == .delete {
  //      medsTableView.beginUpdates()
  //      model.remove(at: indexPath.row)
  //      medsTableView.deleteRows(at: [indexPath],
  //                               with: .fade)
  //
  //      medsTableView.endUpdates()
  //    }
  //  }
  //
  //  func numberOfSections(in tableView: UITableView) -> Int {
  //    return 1
  //  }
  
  
  @IBAction func addNewCell(_ sender: UIButton) {
    self.performSegue(withIdentifier: "reminderSegue",
                      sender: nil)
    
  }
  
}


extension MedsViewController: UITableViewDelegate,
                              UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return model.count
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = medsTableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
    cell.textLabel?.text = model[indexPath.row].title
    return cell
  }
  
  
  func tableView(_ tableView: UITableView,
                 didDeselectRowAt indexPath: IndexPath) {
    medsTableView.deselectRow(at: indexPath,
                              animated: true)
  }
  
  
}


struct MyReminder{
  let title: String
  let date: Date
let timesAdAY: Int
  let inWhichDays: Calendar
  let identifier: String
}
