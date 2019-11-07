//
//  MainVC.swift
//  SwipeableTabBarController
//
//  Created by Kedar Sukerkar on 07/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    // MARK: - Constants
    static let storyboardIdentifier = "MainVC"
    static let storyboardName       = "Main"
    
    // MARK: - Outlets
    @IBOutlet weak var categoryTableView: UITableView!
    
    
    // MARK: - Properties
    let categories = ["TabBarController Demo" , "Material Tabs Demo"]
    
    
    // MARK: - Data Injections
    
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    
    func setupVC(){
        
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
        self.categoryTableView.register(UINib(nibName: "TextTVC", bundle: nil), forCellReuseIdentifier: "TextTVC")
        
       // self.title = "SwipeableTabBarController Demo"
        
    }
    
    func setupUI(){
        
        
        
        
        
        
        
        
    }
    
    // MARK: - IBActions

    

    
}

extension MainVC: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextTVC") as? TextTVC
        
        cell?.titleLabel.text = self.categories[indexPath.row]
        
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            // tab bar
            let storyBoard = UIStoryboard(name: STCTabBarController.storyboardName, bundle: nil)
            let tabBarVC = storyBoard.instantiateViewController(withIdentifier: STCTabBarController.storyboardIdentifier ) as? STCTabBarController
        
            self.navigationController?.pushViewController(tabBarVC!, animated: true)
    
        }else if indexPath.row == 1{
            // material tabs
            
            
            
            
        }
  
    }
    
    
    
    
    
    
    
    
    
    
}
