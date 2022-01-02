

import UIKit

extension MedsReminderViewController :  UIPickerViewDelegate,
                                        UIPickerViewDataSource{
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }


  func pickerView(_ pickerView: UIPickerView,
                  numberOfRowsInComponent component: Int) -> Int {

    return times.count
  }


  func pickerView(_ pickerView: UIPickerView,
                  rowHeightForComponent component: Int) -> CGFloat {
    return 30
  }


  func pickerView(_ pickerView: UIPickerView,
                  viewForRow row: Int,
                  forComponent component: Int,
                  reusing view: UIView?) -> UIView {
    let label = UILabel(frame: CGRect(x: 0,
                                      y: 0,
                                      width: screenWidth,
                                      height: 30))
    label.text = Array(times)[row]
    label.textAlignment = .center
    return label
  }
  
  
  func pickerViewChoose(){
    let vc = UIViewController()
    vc.preferredContentSize = CGSize(width: screenWidth,
                                     height: screenHeight)
    
   pv = UIPickerView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: screenWidth,
                                        height: screenHeight))
    pv.dataSource = self
    pv.delegate = self
    
    pv.selectRow(selectedRow,
                 inComponent: 0,
                 animated: false)
    
    vc.view.addSubview(pv)
    
    pv.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
    pv.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
    
    let alert = UIAlertController(title: "Times a Day",
                                  message: "",
                                  preferredStyle: .actionSheet)
    
    alert.popoverPresentationController?.sourceView = timesADayPickerView
    alert.popoverPresentationController?.sourceRect = timesADayPickerView.bounds
    
    alert.setValue(vc,
                   forKey: "contentViewController")
    alert.addAction(UIAlertAction(title: "Cancel",
                                  style: .cancel,
                                  handler: { (UIAlertAction) in
      
    }))
    
    alert.addAction(UIAlertAction(title: "Select",
                                  style: .default,
                                  handler: { (UIAlertAction) in
      
      self.selectedRow = self.pv.selectedRow(inComponent: 0)
      let name = Array(self.times)[self.selectedRow]
      self.timesADayPickerView.setTitle("  \(name)",
                                        for: .normal)
      
      
    }))
    self.present(alert,
                 animated: true,
                 completion: nil)
  }
  
  
  
  func timePickerChoose() {
    let vc = UIViewController()
    vc.preferredContentSize = CGSize(width: screenWidth,
                                     height: screenHeight)
    
    dp = UIDatePicker(frame: CGRect(x: 0,
                                        y: 0,
                                        width: screenWidth,
                                        height: screenHeight))
    dp.preferredDatePickerStyle = .wheels
    dp.datePickerMode = .time
    vc.view.addSubview(dp)
    
    dp.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
    dp.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
    
    let alert = UIAlertController(title: "Edit Reminder",
                                  message: "",
                                  preferredStyle: .actionSheet)
    
    alert.popoverPresentationController?.sourceView = settingButton
    alert.popoverPresentationController?.sourceRect = settingButton.bounds
    
    alert.setValue(vc,
                   forKey: "contentViewController")
    alert.addAction(UIAlertAction(title: "Cancel",
                                  style: .cancel,
                                  handler: { (UIAlertAction) in
      
    }))
    
    alert.addAction(UIAlertAction(title: "Select",
                                  style: .default,
                                  handler: { [self] (UIAlertAction) in
      // to display only time on seetingButton
      let formatter = DateFormatter()
      formatter.timeStyle = .short
      formatter.dateStyle = .none
      
      self.settingButton.setTitle("  \(formatter.string(from: dp.date))", for: .normal)
      
    }))
    self.present(alert,
                 animated: true,
                 completion: nil)
    
  }
}
