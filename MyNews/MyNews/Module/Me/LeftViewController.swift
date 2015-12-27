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

        
    }

    private func setupUI(){
    
        view.addSubview(personalView)
        
    
    }
    
    private func setPersonalView(){
    
        personalView.addSubview(heardImageView)
        
    
    }
    
    //MARK:- 懒加载视图
    private lazy var tableView: UITableView = UITableView()
    private lazy var personalView: UIView = UIView()
    private lazy var heardImageView : UIImageView = UIImageView(image: UIImage(named: "pa"))
    
    

}
