
import UserNotifications
import UIKit

class MedsReminderViewController: UIViewController,
                                  UITableViewDelegate,
                                  UITableViewDataSource{
  
  @IBOutlet weak var medsNameTF: UITextField!
  
  @IBOutlet weak var timesADayPickerView: UIButton!
  @IBOutlet weak var settingButton: UIButton!
  
  @IBOutlet weak var daysTableView: UITableView!
  
  var pv = UIPickerView()
  var dp = UIDatePicker()
  
  var times = ["Once a day",
               "Twice a day",
               "Thrice a day",
               "Four times a day"]
  
  var daysOfWeek = ["Sunday" ,
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday"]
  
  var screenWidth = UIScreen.main.bounds.width / 2
  var screenHeight = UIScreen.main.bounds.height / 5
  var selectedRow = 0
  
  public var completion: ((String, String, Date, IndexPath) -> Void)?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    daysTableView.dataSource = self
    daysTableView.delegate = self
    
    //to allow multiple chooses from daysTableview
    daysTableView.allowsMultipleSelection = true
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                        style: .done,
                                                        target: self,
                                                        action: #selector(didTapSaveButton))
    
  }

  
  @IBAction func numberOfTimesPressed(_ sender: UIButton) {
    pickerViewChoose()
  }
  
  @IBAction func timePressed(_ sender: UIButton) {
    timePickerChoose()
  }
  
  
  //MARK: - table View
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return daysOfWeek.count
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = daysTableView.dequeueReusableCell(withIdentifier: "day",
                                                 for: indexPath)
    cell.textLabel?.text = daysOfWeek[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "WHICH DAYS?"
  }
  
  
  func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath) {
    
    let cell = daysTableView.cellForRow(at: indexPath)!
    cell.accessoryType = .checkmark
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    let cell = daysTableView.cellForRow(at: indexPath)!
    cell.accessoryType = .none
  }
  
  
  //MARK: -
  @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
    
    
  }
  

  
  @objc func didTapSaveButton(){
//    if let titleText = medsNameTF.text, !titleText.isEmpty,
//    let buttonText = timesADayPickerView.currentTitle != "  HOW MANY TIMES A DAY?",
//      let buttonTextTime = settingButton.currentTitle != "  SET TIME",
//       daysTableView.selectRow != nil{
//      let targetDate = dp.date
//
//      completion?(title
//  }
//
//      UNUserNotificationCenter.current().requestAuthorization(options: [.alert,
//                                                                        .badge,
//                                                                        .sound],
//                                                              completionHandler: {success, error in
//        if success {
//          // schedule reminder
//          self.scheduleReminder()
//        } else if let error = error {
//
//        }
//      })
    
  }
  
  
  func scheduleReminder () {
    let content = UNMutableNotificationContent()
    content.title = "Reminder"
    content.sound = .default
    content.body = "Its time to take \(medsNameTF.text)"
    
    let targetDate = Date().addingTimeInterval(10)
    let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate),
                                                repeats: true)
    
    let request = UNNotificationRequest(identifier: "some_long_id",
                                    content: content,
                                    trigger: trigger)
    
    UNUserNotificationCenter.current().add(request,
                                           withCompletionHandler: {error in
      if error != nil {
        print("somthing went wrong")
      }
    })
  }
  
  
}
