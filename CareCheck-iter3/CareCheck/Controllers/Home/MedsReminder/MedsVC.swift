
import UIKit
import EventKit
import UserNotifications


class MedsViewController: UIViewController {
    
    @IBOutlet weak var addNewCellButton: UIButton!
    
    @IBOutlet weak var medsTableView: UITableView!
    
    var eventStore: EKEventStore!
    var reminders: [EKReminder]!
    var dateText = UITextField()
    var textTitle = UITextField()
    var textDescription = UITextField()
    var datePicker = UIDatePicker(frame: CGRect(x: 0,
                                                y: 0,
                                                width: Int(UIScreen.main.bounds.size.width),
                                                height: 216))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medsTableView.delegate = self
        medsTableView.dataSource = self
        medsTableView.allowsMultipleSelection = true
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]){ (granted, error) in
            
            if (granted) {
                
                print("garanted")
                
            } else {
                CommonFunctions.shared.showAlertMessage(vc: self,
                                                        titleStr: "",
                                                        messageStr: "\(error?.localizedDescription ?? "")")
            }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getReminderDate()
    }
    
    
    func getReminderDate() {
        
        self.eventStore = EKEventStore()
        self.reminders = [EKReminder]()
        self.eventStore.requestAccess(to: .reminder) { (granted, error) in
            
            if granted {
                let predicate = self.eventStore.predicateForReminders(in: nil)
                self.eventStore.fetchReminders(matching: predicate,
                                               completion: {(reminders: [EKReminder]?) -> Void in
                    self.reminders = reminders
                    DispatchQueue.main.async {
                        self.medsTableView.reloadData()
                    }
                })
            } else {
                CommonFunctions.shared.showAlertMessage(vc: self,
                                                        titleStr: "",
                                                        messageStr: "The app is not allowed to access reminders, make sure to grant permission in the settings and try again")
            }
            
        }
    }
    
    
    @objc func dateTextValueChanged () {
        let today = self.datePicker.date
        self.dateText.text = today.toString(dateFormat: "HH:mm")
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
    //  elete
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
        //            self.performSegue(withIdentifier: "reminderSegue",
        //                              sender: nil)
        let alert = UIAlertController(title: "Add Reminder",
                                      message: "",
                                      preferredStyle: .alert)
        alert.addTextField{(textfiled) in
            self.textTitle = textfiled
            self.textTitle.autocapitalizationType = .sentences
            textfiled.placeholder = "Enter Title"
        }
        
        alert.addTextField{(textfiled) in
            self.textDescription = textfiled
            self.textDescription.autocapitalizationType = .sentences
            textfiled.placeholder = "Enter Description"
        }
        
        alert.addTextField {(textfiled) in
            textfiled.placeholder = "Select Time"
            self.dateText = textfiled
            self.datePicker.datePickerMode = .time
            self.datePicker.preferredDatePickerStyle = .wheels
            self.datePicker.addTarget(self,
                                      action: #selector(self.dateTextValueChanged), for: .valueChanged)
            textfiled.inputView = self.datePicker
        }
        alert.addAction(UIAlertAction(title: "Save",
                                      style: .default,
                                      handler: { (alert) in
            self.saveReminder(remi: nil)
        }))
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    
    func saveReminder(remi: EKReminder?){
        let reminder = (remi != nil) ? remi : EKReminder(eventStore: self.eventStore)
        
        if remi != nil {
            self.removeNotification(remi: remi!)
        }
        
        reminder!.title = self.textTitle.text ?? ""
        reminder!.notes = self.textDescription.text ?? ""
        let componentsTwo = Calendar.current.dateComponents([.hour, .minute], from: self.datePicker.date)
        
        let totalComponents = NSDateComponents()
        totalComponents.year = componentsTwo.year ?? 0
        totalComponents.month = componentsTwo.month ?? 0
        totalComponents.day = componentsTwo.day ?? 0
        totalComponents.hour = componentsTwo.hour ?? 0
        totalComponents.minute = componentsTwo.minute ?? 0
        
        reminder!.dueDateComponents = totalComponents as DateComponents
        reminder!.calendar = self.eventStore.defaultCalendarForNewReminders()
        
        do{
            try self.eventStore.save(reminder!, commit: true)
            print("Saved")
            self.getReminderDate()
            self.setNotifications(remi: reminder!)
        } catch {
            CommonFunctions.shared.showAlertMessage(vc: self,
                                                    titleStr: "", messageStr: "Error creating and saving new reminder: \(error.localizedDescription)")
        }
    }
    
    
    @objc func removeReminder(sender: UIButton) {
        let reminder: EKReminder = reminders[sender.tag]
        do {
            try eventStore.remove(reminder, commit: true)
            self.reminders.remove(at: sender.tag)
            self.medsTableView.reloadData()
            self.removeNotification(remi: reminder)
        } catch {
            CommonFunctions.shared.showAlertMessage(vc: self,
                                                    titleStr: "", messageStr: "An error occurred while removing the reminder from the Calender database: \(error.localizedDescription)")
        }
    }
    
    @objc func editReminder(sender: UIButton){
        let alert = UIAlertController(title: "Edit Reminder",
                                      message: "",
                                      preferredStyle: .alert)
        
        alert.addTextField{(textfiled) in
            self.textTitle = textfiled
            self.textTitle.autocapitalizationType = .sentences
        }
        
        alert.addTextField{(textfiled) in
            self.textDescription = textfiled
            self.textDescription.autocapitalizationType = .sentences
        }
        
        alert.addTextField{(textfiled) in
            self.dateText = textfiled
            self.datePicker.datePickerMode = .time
            self.datePicker.preferredDatePickerStyle = .wheels
            self.datePicker.addTarget(self,
                                      action: #selector(self.dateTextValueChanged),
                                      for: .valueChanged)
            textfiled.inputView = self.datePicker
        }
        
        
        let reminder: EKReminder = reminders[sender.tag]
        self.textTitle.text = reminder.title
        self.textDescription.text = reminder.notes
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        if let dueDate = reminder.dueDateComponents?.date{
            self.dateText.text = formatter.string(from: dueDate)
        } else {
            self.dateText.placeholder = "Select Time"
        }
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: .default,
                                      handler: {(alert) in
            self.saveReminder(remi: reminder)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: {(alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func setNotifications(remi: EKReminder){
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: remi.title,
                                                                 arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: remi.notes ?? "",
                                                                arguments: nil)
        
        content.sound = .default
        
        let dateComponents = Calendar.autoupdatingCurrent.dateComponents([.day,
                                                                          
                                                                            .month,
                                                                          .year,
                                                                          .hour,
                                                                          .minute,
                                                                          .second]
                                                                         ,from: self.datePicker.date)
        var dateComponent = DateComponents()
        dateComponent.hour = dateComponents.hour
        dateComponent.minute = dateComponents.minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        let request = UNNotificationRequest(identifier: remi.title,
                                            content: content,
                                            trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request) {(error : Error? ) in
            if let theError = error {
                print(theError.localizedDescription)
            }
            
        }
        
    }
    
    func removeNotification(remi : EKReminder) {
        let center = UNUserNotificationCenter.current()
        center.removeDeliveredNotifications(withIdentifiers: [remi.title])
        center.removePendingNotificationRequests(withIdentifiers: [remi.title])
    }
}
    
    //    extension MedsViewController: UITableViewDelegate,
    //                                  UITableViewDataSource {
    //
    //        func numberOfSections(in tableView: UITableView) -> Int {
    //            return 1
    //        }
    //
    //
    //        func tableView(_ tableView: UITableView,
    //                       numberOfRowsInSection section: Int) -> Int {
    //            return model.count
    //        }
    //
    //
    //        func tableView(_ tableView: UITableView,
    //                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //            let cell = medsTableView.dequeueReusableCell(withIdentifier: "cell",
    //                                                         for: indexPath)
    //            cell.textLabel?.text = model[indexPath.row].title
    //            return cell
    //        }
    //
    //
    //        func tableView(_ tableView: UITableView,
    //                       didDeselectRowAt indexPath: IndexPath) {
    //            medsTableView.deselectRow(at: indexPath,
    //                                      animated: true)
    //        }
    //
    //
    //    }
    //
    //
    //struct MyReminder{
    //  let title: String
    //  let date: Date
    //let timesAdAY: Int
    //  let inWhichDays: Calendar
    //  let identifier: String
    //}
    //extension MedsViewController
    
    
    extension MedsViewController :  UITableViewDelegate,
                                    UITableViewDataSource {
        
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell : ReminderTableCell?
            
            if cell == nil {
                cell = Bundle.main.loadNibNamed("reminderTableCell",
                                                owner: nil,
                                                options: nil)?.first as? ReminderTableCell
            }
            
            let reminder :EKReminder! = self.reminders![indexPath.row]
            cell?.titleLabel.text = reminder.title
            cell?.descriptionLabel.text = reminder.notes ?? ""
            
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            if let dueDate = reminder.dueDateComponents?.date{
                cell?.timeLabel?.text = formatter.string(from: dueDate)
            } else {
                cell?.timeLabel?.text = "N/A"
            }
            
            
            cell?.deleteButton.tag = indexPath.row
            cell?.deleteButton.addTarget(self,
                                         action: #selector(self.removeReminder(sender:)),
                                         for: .touchUpInside)
            cell?.editButton.tag = indexPath.row
            cell?.editButton.addTarget(self,
                                       action: #selector(self.editReminder(sender:)),
                                       for: .touchUpInside)
            return cell!
        }
        
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return self.reminders.count
        }
    }
    
    extension MedsViewController: UNUserNotificationCenterDelegate {
        func userNotificationVenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            print(notification.request.content.title)
            
            completionHandler([.banner, .badge, .sound])
        }
        
        
        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    didReceive response: UNNotificationResponse,
                                    withCompletionHandler completionHandler: @escaping () -> Void) {
            print(response.notification.request.content.title)
        }
    }
    

extension Date {
    func toString(dateFormat format : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
    
    
    class CommonFunctions {
        
        static var shared = CommonFunctions()
        
        //show alert
        func showAlertMessage(vc: UIViewController,
                              titleStr: String,
                              messageStr: String) -> Void{
            let alert = UIAlertController(title: titleStr,
                                          message: messageStr,
                                          preferredStyle: UIAlertController.Style.alert);
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            vc.present(alert,
                       animated: true,
                       completion: nil)
            
        }
    }
    
    
