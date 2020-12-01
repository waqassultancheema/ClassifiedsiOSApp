//
//  ClassifiedImageTableViewCell.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit
import Kingfisher

class ClassifiedImageTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!
    
    func setImageURL(url:String) {
        if let imgUrl = URL(string: url) {
            self.newsImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "asset2"))
        }
    }
    
    func bindData(classified: ViewModel.DisplayViewModel.ClassifiedViewModel) {
        self.setImageURL(url: classified.imageLink)
        self.captionLabel.text = classified.name
    }
}
