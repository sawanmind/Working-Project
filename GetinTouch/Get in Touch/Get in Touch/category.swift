//
//  category.swift
//  Get in Touch
//
//  Created by Sawkan Team on 16/06/17.
//  Copyright © 2017 Sawkan Team. All rights reserved.
//

import UIKit

class category: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CATEGORIES"
        
        
        tableView  = UITableView(frame: self.tableView.frame, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
       
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        return cell
    }
}
