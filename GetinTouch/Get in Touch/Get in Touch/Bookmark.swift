//
//  Bookmark.swift
//  Get in Touch
//
//  Created by Sawkan Team on 16/06/17.
//  Copyright © 2017 Sawkan Team. All rights reserved.
//

import UIKit

class Bookmark: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "BOOKMARK"
        tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        tableView.register(customnewsCell.self, forCellReuseIdentifier: "cell")
        tableView.showsVerticalScrollIndicator = false
        
        
    }
    
    
    

    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customnewsCell
        cell.selectionStyle = .none
        
      //  cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 570
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
}







extension Bookmark {
    

    
    
    
    
    
    
    func savebookmark(cell: customnewsCell) {
        
        if cell.bookmarkimg.image == UIImage(named:"bookmark2") {
            cell.bookmarkimg.image = UIImage(named: "bookmarkselected")
            
            
            
        }
            
        else  {
            cell.bookmarkimg.image = UIImage(named: "bookmark2")
            
            
        }
    }
}


