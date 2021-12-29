

import UIKit

class CameraViewController: UIViewController {
  
  
  @IBOutlet var cameraTableView: UITableView!
  @IBOutlet weak var photoTakenView: UIImageView!
  
  @IBOutlet weak var takePhotoButton: UIButton!
  @IBOutlet weak var savePhotoButton: UIButton!
  
  var rowsWhichAreChecked = [NSIndexPath]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    cameraTableView.delegate = self
    cameraTableView.dataSource = self
    
  }
  
  
  
  @IBAction func takeAPhotoPressed(_ sender: UIButton) {
    takePhoto()
  }
  
  @IBAction func saveThePhotoPressed(_ sender: UIButton) {
    UIImageWriteToSavedPhotosAlbum(photoTakenView.image!,
                                   self,
                                   #selector(savePhoto(_:didFinishSavingWithError:contextInfo:)),
                                   nil)
  }
  
  
  func takePhoto(){
    let picker = UIImagePickerController()
    picker.sourceType = .camera
    picker.delegate = self
    present(picker,
            animated: true)
  }
  
  
  @objc func savePhoto(_ image: UIImage,
                       didFinishSavingWithError error: Error?,
                       contextInfo: UnsafeRawPointer) {
    if let error = error {
      
      // we got back an error!
      let ac = UIAlertController(title: "Save error",
                                 message: error.localizedDescription,
                                 preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK",
                                 style: .default))
      present(ac,
              animated: true)
    } else {
      
      let ac = UIAlertController(title: "Saved!",
                                 message: "Image has been saved to your photos.",
                                 preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK",
                                 style: .default))
      present(ac,
              animated: true)
    }
  }
  
  
//  func imagePickerController(_ picker: UIImagePickerController,
//                             didFinishPickingMediaWithInfo info: [String : Any]) {
//    picker.dismiss(animated: true,
//                   completion: nil)
//    picker. = info[UIImagePickerControllerOriginalImage.rawValue] as? UIImage
//  }
  
}



extension CameraViewController: UITableViewDelegate,
                                UITableViewDataSource,
                                UIImagePickerControllerDelegate,
                                UINavigationControllerDelegate{
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = cameraTableView.dequeueReusableCell(withIdentifier: "cell",
                                                   for: indexPath)
//    cell.textLabel?.text = cameraTableView[indexPath.row].title
//
//        = cameraTableView.dequeueReusableCell(withIdentifier: "cell")
//
//        cell.medNameLabel.text = self.arr[indexPath.row]
//        let isRowChecked = rowsWhichAreChecked.contains(indexPath as NSIndexPath)
//        if isRowChecked == true {
//          cell.checkBoxButton.isChecked = false
//          cell.checkBoxButton.buttonChecked(sender: cell.checkBoxButton)
//
//        }else {
//          cell.checkBoxButton.isChecked = true
//          cell.checkBoxButton.buttonChecked(sender: cell.checkBoxButton)
//        }
    return cell
  }
  
  
  func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: "reminderSegue", sender: nil)
  }
  
  
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true,
                   completion: nil)
  }
  
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true,
                   completion: nil)
    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
    photoTakenView.image = image
  }
}

