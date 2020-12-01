//
//  CustomButton.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/11/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

@IBDesignable open class IconButton: UIButton  {
    
    private func setupValues(){
        let buttonImage = self.imageView?.image!
        self.setImage(buttonImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.tintColor = .white
        
    }
    
//    open override func prepareForInterfaceBuilder() {
//        self.setupValues()
//        
//    }
    
    open override func awakeFromNib() {
        self.setupValues()
    }
    
}
