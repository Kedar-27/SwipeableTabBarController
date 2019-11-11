//
//  STCMaterialTabsPVC.swift
//  SwipeableTabBarController
//
//  Created by Kedar Sukerkar on 07/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit

class STCMaterialTabsPVC: KPageViewController {

    // MARK: - Constants
    static let storyboardIdentifier = "STCMaterialTabsPVC"
    static let storyboardName       = "MaterialTabs"
    
    // MARK: - Outlets
    
    
    
    // MARK: - Properties
    
    
    
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
        
        
        
        
    }
    
    func setupUI(){
        
        
        
        
        
        
        
        
    }
    
    // MARK: - IBActions


}
