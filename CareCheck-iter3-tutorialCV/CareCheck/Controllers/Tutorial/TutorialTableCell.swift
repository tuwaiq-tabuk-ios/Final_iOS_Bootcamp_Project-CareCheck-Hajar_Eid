//
//  TutorialTableCell.swift
//  CareCheck
//
//  Created by HAJAR on 31/12/2021.
//

import UIKit

class TutorialTableCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    var video: Video! {
        didSet {
            updateUI()
        }
    }
     
    func updateUI() {
        thumbnailImageView.image = UIImage(named: video.thumbnailFileName)
        thumbnailImageView.layer.cornerRadius = 0.5
        thumbnailImageView.layer.masksToBounds = true
        userNameLabel.text = video.authorName
    }
}

