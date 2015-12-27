//
//  LeftViewController.swift
//  MyNews
//
//  Created by 赫腾飞 on 15/12/27.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

let LeftCellID = "LeftCellID"

class LeftViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }

    private func setupUI(){
    
        view.addSubview(personalView)
        personalView.addSubview(heardImageView)
        personalView.addSubview(nameBtn)
        view.addSubview(tableView)
        
        personalView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp_top).offset(80)
            make.height.equalTo(100)
            make.width.equalTo(200)
            make.left.equalTo(view.snp_left)
        }
        heardImageView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(personalView.snp_left).offset(10)
            make.top.equalTo(personalView.snp_top).offset(10)
            make.width.height.equalTo(60)
        }
        nameBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(heardImageView.snp_top)
            make.left.equalTo(heardImageView.snp_right).offset(10)
        }
        tableView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp_left)
            make.top.equalTo(personalView.snp_bottom).offset(50)
            make.width.equalTo(200)
            make.bottom.equalTo(view.snp_bottom).offset(-100)
        }
        
    
    }
    //MARK:- 数据源方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(LeftCellID, forIndexPath: indexPath)
        
//        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.darkGrayColor() : UIColor.lightGrayColor()
       
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .None
        
        switch indexPath.row{
            
        case 0:
            cell.imageView?.image = UIImage(named: "IconProfile")
            cell.textLabel?.text = "我"
        case 1:
            cell.imageView?.image = UIImage(named: "IconSettings")
            cell.textLabel?.text = "设置"
        case 2:
            cell.imageView?.image = UIImage(named: "IconHome")
            cell.textLabel?.text = "主页"
        case 3:
            cell.imageView?.image = UIImage(named: "IconCalendar")
            cell.textLabel?.text = "日历"
            
        default :
            cell.imageView?.image = UIImage(named: "IconProfile")
            cell.textLabel?.text = "我"
        }
        return cell
        
    }
    //MARK:- 代理方法监控Cell的点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch (indexPath.row) {
        case 0:
            print("Model到个人信息控制器")
        case 1:
            print("Model到设置界面")
        case 2:
            print("Model到主页面")
        case 3:
            print("Model日历界面")
            
        default :
            print("其他情况")
        
        }
        
    }
    
    
    //MARK:- 懒加载视图
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        
        
        tableView.rowHeight = 50
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: LeftCellID)
        
        tableView.backgroundColor = UIColor.clearColor()
    
        return tableView
    
    }()
    private lazy var personalView: UIView = {
        
        let personalView = UIView()
        
        return personalView
        
    }()
    //头像
    private lazy var heardImageView : UIImageView = {
        let headImageView = UIImageView(image: UIImage(named: "pa"))
        headImageView.layer.masksToBounds = true
        headImageView.layer.cornerRadius = 30
        return headImageView
    }()
    
    private lazy var nameBtn: UIButton = {
        
        let btn = UIButton()
        btn.setTitle("MyNews", forState: .Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        return btn
    
    }()
    

}
