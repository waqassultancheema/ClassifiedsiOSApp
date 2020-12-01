//
//  Extensions.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/14/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol AlertView   {
    func displayalert(title:String, message:String)
}

extension AlertView where Self: ClassifiedViewController {
    
    func displayalert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: "\(message) \n\nPlease Press Retry", preferredStyle: UIAlertController.Style.alert)
        alert.addAction((UIAlertAction(title: "Retry", style: .default, handler: { [unowned self] (action) -> Void in
            self.fetchClassified()
            alert.dismiss(animated: true, completion: nil)
            
        })))
        self.present(alert, animated: true, completion: nil)
    }
}
extension UIView {
    func startActivityIndicator() {
        ActivityIndicator.sharedInstance.showProgressView(view: self)
    }
    
    func stopActivityIndicator() {
        ActivityIndicator.sharedInstance.hideProgressView()
    }
}

extension UIColor {
    class func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

extension String {
    func getDateFromTimeStamp() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date: Date = dateFormatterGet.date(from: self) {
            return dateFormatterPrint.string(from: date)
        }
        return ""
    }
}

