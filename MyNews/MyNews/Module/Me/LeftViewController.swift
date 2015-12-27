//
//  LeftViewController.swift
//  MyNews
//
//  Created by 赫腾飞 on 15/12/27.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI(){
    
        view.addSubview(personalView)
        personalView.addSubview(heardImageView)
        personalView.addSubview(nameBtn)
        
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
        
    
    }
    
    //MARK:- 懒加载视图
    private lazy var tableView: UITableView = UITableView()
    private lazy var personalView: UIView = {
        
        let personalView = UIView()
        personalView.backgroundColor = UIColor.whiteColor()
        return personalView
        
    }()
    private lazy var heardImageView : UIImageView = UIImageView(image: UIImage(named: "pa"))
    
    private lazy var nameBtn: UIButton = {
        
        let btn = UIButton()
        btn.setTitle("MyNews", forState: .Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        return btn
    
    }()
    

}
