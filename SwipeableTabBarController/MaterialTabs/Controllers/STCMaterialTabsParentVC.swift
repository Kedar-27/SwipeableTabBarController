//
//  STCMaterialTabsParentVC.swift
//  SwipeableTabBarController
//
//  Created by Kedar Sukerkar on 11/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

class STCMaterialTabsParentVC: UIViewController {

    // MARK: - Constants
    static let storyboardIdentifier = "STCMaterialTabsParentVC"
    static let storyboardName       = "MaterialTabs"
    
    // MARK: - Outlets
    
    @IBOutlet weak var materialTabsView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Properties
    var tabBar = MDCTabBar()
    var pageController = STCMaterialTabsPVC()
    
    // MARK: - Data Injections
    
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupVC()
        self.createPageViewController()
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
        tabBar = MDCTabBar(frame: self.materialTabsView.bounds)
        tabBar.items = [
        UITabBarItem(title: "Recents", image: UIImage(named: "play"), tag: 0),
        UITabBarItem(title: "Favorites", image: UIImage(named: "music"), tag: 1),
        UITabBarItem(title: "New", image: UIImage(named: "star"), tag: 2)
        ]
        
        tabBar.delegate = self
        
        tabBar.itemAppearance = .titledImages
        tabBar.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        tabBar.sizeToFit()
        self.materialTabsView.addSubview(tabBar)
        
        
        
    }
    
    func setupUI(){
        
        
        
        
        
        
        
        
    }

    private func createPageViewController(){
        
        let leftController = ViewController()
        let centerController = ViewController2()
        let rightController = ViewController3()
        
        leftController.view.tag = 0
        centerController.view.tag = 1
        rightController.view.tag = 2
        
        leftController.view.backgroundColor = .brown
        centerController.view.backgroundColor = .orange
        rightController.view.backgroundColor = .yellow
      
        let storyBoard = UIStoryboard.init(name: STCMaterialTabsPVC.storyboardName, bundle: nil)
        
        guard let pageViewController = storyBoard.instantiateViewController(withIdentifier: STCMaterialTabsPVC.storyboardIdentifier) as? STCMaterialTabsPVC else { return }
        
        self.pageController = pageViewController
       
        
        
        pageViewController.pages = [leftController, centerController, rightController]
        
        pageViewController.view.tag = 1
        pageViewController.swipeDelegate = self
        pageViewController.selectPage(at: 0)
       
        // Add the child's View as a subview
        self.containerView.addSubview(pageViewController.view)
        self.addChild(pageViewController)
        pageViewController.view.frame = containerView.bounds
        pageViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // tell the childviewcontroller it's contained in it's parent
        pageViewController.didMove(toParent: self)
        
        
        
    }
    // MARK: - IBActions


}
extension STCMaterialTabsParentVC: MDCTabBarDelegate, KPageViewControllerDelegate{
    
    func tabBar(_ tabBar: MDCTabBar, shouldSelect item: UITabBarItem) -> Bool {
        self.pageController.selectPage(at: item.tag)
        
        
        return true
    }
    
    func pageDidSwipe(to index: Int) {
       
        self.tabBar.selectedItem = self.tabBar.items[index]
    }
    
    
    
}
