//
//  Highlights.swift
//  Get in Touch
//
//  Created by Sawkan Team on 16/06/17.
//  Copyright © 2017 Sawkan Team. All rights reserved.
//

import UIKit

protocol newshighlightDelegate {
    func savebookmark(cell:customnewsCell)
}

class Highlights: UITableViewController , newshighlightDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        setupnaviation()
        
        tableView.backgroundColor = UIColor.bgColor
        tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        tableView.register(customnewsCell.self, forCellReuseIdentifier: "cell")
        tableView.showsVerticalScrollIndicator = false
        
      
    }
    
    
    
    let navView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 30))
        view.contentMode = .center
        return view
    }()
    
    
    let logoImage:UIImageView = {
        let topImg = UIImageView()
        topImg.contentMode = .scaleAspectFit
        topImg.image = UIImage(named: "homelogo")
        topImg.translatesAutoresizingMaskIntoConstraints = false
        return topImg
    }()
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customnewsCell
        cell.selectionStyle = .none
      
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 570
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

   
}







extension Highlights {
    
    func setupnaviation(){
        
        navigationItem.titleView = navView
        navView.addSubview(logoImage)
        setuplogoImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"category"), style: .plain, target: self, action: #selector(handleright))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"search"), style: .plain, target: self, action: #selector(handleright))
        
        
    }
    

    
    func setuplogoImage(){
        
        logoImage.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: navView.centerYAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    func handleright(){
        
        let new = category()
        new.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(new, animated: true)
        
    }
    

    
    
    func savebookmark(cell: customnewsCell) {
        
        if cell.bookmarkimg.image == UIImage(named:"bookmark2") {
            cell.bookmarkimg.image = UIImage(named: "bookmarkselected")
            
         
            
        }
            
        else  {
            cell.bookmarkimg.image = UIImage(named: "bookmark2")
           
            
        }
    }
}






class customnewsCell: UITableViewCell {
    
    var delegate: newshighlightDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setuplayout()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2.4
        let attrString = NSMutableAttributedString(string: newsdescription.text!)
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        newsdescription.attributedText = attrString
    }
    
    func setuplayout(){
        setupnewsImg()
        setupsortbylbl()
        setupauthorlbl()
        setupsourcelbl()
        setuppublishtimelbl()
        setupnewstitle()
        setupnewsdescription()
        setupbookmarkimgbtn()
        setupreadlaterlbl()
        setupshareimgbtn()
        
    }
    
    
    
    lazy var bookmarkimg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "bookmark2")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    func setupbookmarkimg(){
        addSubview(bookmarkimg)
        bookmarkimg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7).isActive = true
        bookmarkimg.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28).isActive = true
        bookmarkimg.widthAnchor.constraint(equalToConstant: 28).isActive = true
        bookmarkimg.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }

    lazy var bookmarkimgbtn: UIButton = {
       let img = UIButton()
        img.backgroundColor = UIColor.clear
        img.addTarget(self, action: #selector(customnewsCell.handlebookmark), for: .touchUpInside)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    func setupbookmarkimgbtn(){
        addSubview(bookmarkimgbtn)
        setupbookmarkimg()
        bookmarkimgbtn.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bookmarkimgbtn.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bookmarkimgbtn.widthAnchor.constraint(equalToConstant: 66).isActive = true
        bookmarkimgbtn.heightAnchor.constraint(equalToConstant: 86).isActive = true
    }
    
    
    
    func handlebookmark(sender: AnyObject){
       delegate?.savebookmark(cell: self)
    }
    
    
    
    lazy var readlaterlbl: UIButton = {
        let img = UIButton(type: .system)
        img.backgroundColor = UIColor.clear
        img.setTitle("Read Later", for: .normal)
        img.setTitleColor(UIColor.black, for: .normal)
        img.setTitleColor(UIColor.highlitedcolor, for: .highlighted)
        img.addTarget(self, action: #selector(customnewsCell.handlebookmark), for: .touchUpInside)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    
    func setupreadlaterlbl(){
        addSubview(readlaterlbl)
        readlaterlbl.leadingAnchor.constraint(equalTo: bookmarkimg.trailingAnchor,constant:9).isActive = true
        readlaterlbl.centerYAnchor.constraint(equalTo: bookmarkimg.centerYAnchor).isActive = true
        readlaterlbl.widthAnchor.constraint(equalTo: readlaterlbl.widthAnchor).isActive = true
        readlaterlbl.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
    
    
    
    lazy var shareimg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "share")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    func setupshareimg(){
        addSubview(shareimg)
        shareimg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -7).isActive = true
        shareimg.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28).isActive = true
        shareimg.widthAnchor.constraint(equalToConstant: 28).isActive = true
        shareimg.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
    
    lazy var shareimgbtn: UIButton = {
        let img = UIButton()
        img.backgroundColor = UIColor.clear
        img.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    func setupshareimgbtn(){
        addSubview(shareimgbtn)
        setupshareimg()
        shareimgbtn.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        shareimgbtn.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        shareimgbtn.widthAnchor.constraint(equalToConstant: 46).isActive = true
        shareimgbtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    
    
    lazy var newsImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Bitmap 13")
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    func handleShare(){
        
        
    }
    func setupnewsImg(){
        contentView.addSubview(newsImg)
        newsImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        newsImg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        newsImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        newsImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    
    let sortbylbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Latest"
        lbl.textColor = UIColor.white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func setupsortbylbl(){
        newsImg.addSubview(sortbylbl)
        sortbylbl.rightAnchor.constraint(equalTo: newsImg.rightAnchor, constant: -7).isActive = true
        sortbylbl.topAnchor.constraint(equalTo: newsImg.topAnchor, constant: 7).isActive = true
        sortbylbl.widthAnchor.constraint(equalTo: sortbylbl.widthAnchor).isActive = true
        sortbylbl.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }


    let authorlbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Matthew Hughes"
        lbl.textColor = UIColor.white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func setupauthorlbl(){
        newsImg.addSubview(authorlbl)
        authorlbl.leftAnchor.constraint(equalTo: newsImg.leftAnchor, constant: 7).isActive = true
        authorlbl.topAnchor.constraint(equalTo: newsImg.topAnchor, constant: 7).isActive = true
        authorlbl.widthAnchor.constraint(equalTo: authorlbl.widthAnchor).isActive = true
        authorlbl.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }

    
    
    let sourcelbl: UILabel = {
       let lbl = UILabel()
       lbl.text = "THENEXTWEB"
        lbl.textColor = UIColor.lightGray
        lbl.font  = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
       return lbl
    }()
    
    func setupsourcelbl(){
        addSubview(sourcelbl)
        sourcelbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        sourcelbl.topAnchor.constraint(equalTo: newsImg.bottomAnchor, constant: 15).isActive = true
        sourcelbl.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        sourcelbl.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    let publishtimelbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "2017-06-16T12:57:04Z"
        lbl.textColor = UIColor.lightGray
        lbl.font  = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func setuppublishtimelbl(){
        addSubview(publishtimelbl)
        publishtimelbl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7).isActive = true
        publishtimelbl.topAnchor.constraint(equalTo: newsImg.bottomAnchor, constant: 15).isActive = true
        publishtimelbl.widthAnchor.constraint(equalTo: publishtimelbl.widthAnchor).isActive = true
        publishtimelbl.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    
    let newstitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "ISIS, Ukraine and more: Defense secretary more: Defense secretary "
        lbl.textColor = UIColor.black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 3
        lbl.contentMode = .top
        lbl.font = UIFont.systemFont(ofSize: 30, weight: .greatestFiniteMagnitude)
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    func setupnewstitle(){
        addSubview(newstitle)
        newstitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7).isActive = true
        newstitle.topAnchor.constraint(equalTo: sourcelbl.bottomAnchor, constant: 7).isActive = true
        newstitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        newstitle.heightAnchor.constraint(equalToConstant: 125).isActive = true
    }
    
    
    
    let newsdescription: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = UIColor.clear
        lbl.text = "One of the few smart things the Trump administration has done since it came to power is cutting down on several paperwork requirements (PDF) for federal agencies, including one that ...One of the few smart things the Trump administration has done since it came to power is cutting down on several paperwork requirements (PDF) for federal agencies, including one that ..."
        lbl.textColor = UIColor.gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textAlignment = .natural
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .greatestFiniteMagnitude)
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    func setupnewsdescription(){
        addSubview(newsdescription)
        newsdescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant:7).isActive = true
        newsdescription.topAnchor.constraint(equalTo: newstitle.bottomAnchor, constant: 2).isActive = true
        newsdescription.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -7).isActive = true
        newsdescription.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
























