//
//  KTabBarController.swift
//  SwipeableTabBarController
//
//  Created by Kedar Sukerkar on 07/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit

class KTabBarController: UITabBarController {
    
    
    // MARK: - Properties
    
    let selectedColor = UIColor.blue
    let deselectedColor = UIColor.gray
    
    let tabBarImages = [
        UIImage(named: "music")!,
        UIImage(named: "play")!,
        UIImage(named: "star")!
    ]
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        
        view.backgroundColor = .gray
        
        self.delegate = self
        tabBar.isTranslucent = true
        tabBar.tintColor = deselectedColor
        tabBar.unselectedItemTintColor = deselectedColor
        tabBar.barTintColor = UIColor.white.withAlphaComponent(0.92)
        tabBar.itemSpacing = 10.0
        tabBar.itemWidth = 76.0
        tabBar.itemPositioning = .centered
        
        self.setUpTabBarController()
        
        self.selectPage(at: 0)
    }
    
    private func setUpTabBarController() {
        
        guard let centerPageViewController = createCenterPageViewController() else { return }
        
        var controllers: [UIViewController] = []
        
        controllers.append(createPlaceholderViewController(forIndex: 0))
        controllers.append(centerPageViewController)
        controllers.append(createPlaceholderViewController(forIndex: 2))
        
        setViewControllers(controllers, animated: false)
        
        selectedViewController = centerPageViewController
    }
    
    private func selectPage(at index: Int) {
        guard let viewController = self.viewControllers?[index] else { return }
        self.handleTabBarItemChange(viewController: viewController)
        guard let PageViewController = (self.viewControllers?[1] as? KPageViewController) else { return }
        PageViewController.selectPage(at: index)
    }
    /// Creating placeholder controllers for creating tabBarItems 
    private func createPlaceholderViewController(forIndex index: Int) -> UIViewController {
        let emptyViewController = UIViewController()
        emptyViewController.tabBarItem = tabBarItem(at: index)
        emptyViewController.view.tag = index
        return emptyViewController
    }
    
    private func createCenterPageViewController() -> UIPageViewController? {
        
        let leftController = ViewController()
        let centerController = ViewController2()
        let rightController = ViewController3()
        
        leftController.view.tag = 0
        centerController.view.tag = 1
        rightController.view.tag = 2
        
        leftController.view.backgroundColor = .brown
        centerController.view.backgroundColor = .orange
        rightController.view.backgroundColor = .yellow
        
        //let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
//        guard let pageViewController = storyBoard.instantiateViewController(withIdentifier: "KPageViewController") as? KPageViewController else { return nil }
        
        
        let pageViewController = KPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        
        pageViewController.pages = [leftController, centerController, rightController]
        pageViewController.tabBarItem = tabBarItem(at: 1)
        pageViewController.view.tag = 1
        pageViewController.swipeDelegate = self
        
        return pageViewController
    }
    /// Get tabBarItem at index
    private func tabBarItem(at index: Int) -> UITabBarItem {
        return UITabBarItem(title: nil, image: self.tabBarImages[index], selectedImage: nil)
    }
    
    private func handleTabBarItemChange(viewController: UIViewController) {
        guard let viewControllers = self.viewControllers else { return }
        let selectedIndex = viewController.view.tag
        self.tabBar.tintColor = selectedColor
        self.tabBar.unselectedItemTintColor = selectedColor
        
        for i in 0..<viewControllers.count {
            let tabbarItem = viewControllers[i].tabBarItem
            let tabbarImage = self.tabBarImages[i]
            tabbarItem?.selectedImage = tabbarImage.withRenderingMode(.alwaysTemplate)
            tabbarItem?.image = tabbarImage.withRenderingMode(
                i == selectedIndex ? .alwaysOriginal : .alwaysTemplate
            )
        }
        
        if selectedIndex == 1 {
            viewControllers[selectedIndex].tabBarItem.selectedImage = self.tabBarImages[1].withRenderingMode(.alwaysOriginal)
        }
    }
}


extension KTabBarController: UITabBarControllerDelegate, KPageViewControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        self.selectPage(at: viewController.view.tag)
        return false
    }
    
    func pageDidSwipe(to index: Int) {
        guard let viewController = self.viewControllers?[index] else { return }
        self.handleTabBarItemChange(viewController: viewController)
    }
    
}

class ViewController: UIViewController {

}

class ViewController2: UIViewController {
    
}

class ViewController3: UIViewController {
    
}
