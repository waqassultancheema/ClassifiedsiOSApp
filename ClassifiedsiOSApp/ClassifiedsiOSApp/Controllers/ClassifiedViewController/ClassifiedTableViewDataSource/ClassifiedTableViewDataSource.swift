//
//  ClassifiedTableViewDataSource.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ClassifiedTableViewDataSourceDelegate {
    func selectedClassified(index:Int)
}
class ClassifiedTableViewDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var classifieds:[ViewModel.DisplayViewModel.ClassifiedViewModel] = Array<ViewModel.DisplayViewModel.ClassifiedViewModel>()
    var delegate:ClassifiedTableViewDataSourceDelegate?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ClassifiedImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ClassifiedImageTableViewCell", for: indexPath) as! ClassifiedImageTableViewCell
        
        let classified: ViewModel.DisplayViewModel.ClassifiedViewModel = classifieds[indexPath.row]
        cell.bindData(classified: classified)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedClassified(index: indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  classifieds.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
