//
//  ClassifiedDetailTableViewDataSource.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit


class ClassifiedDetailTableViewDataSource: NSObject, UITableViewDelegate,UITableViewDataSource {
    
    var classified: ViewModel.DisplayViewModel.ClassifiedViewModel = ViewModel.DisplayViewModel.ClassifiedViewModel()

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell:ClassifiedTitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ClassifiedTitleTableViewCell", for: indexPath) as! ClassifiedTitleTableViewCell
            cell.titleLabel.text = "Price " + classified.price + " Only"
            return cell
        }   else  {
            let cell:ClassifiedImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ClassifiedImageTableViewCell", for: indexPath) as! ClassifiedImageTableViewCell
            cell.bindData(classified: classified)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

