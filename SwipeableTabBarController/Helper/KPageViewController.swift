//
//  KPageViewController.swift
//  SwipeableTabBarController
//
//  Created by Kedar Sukerkar on 07/11/19.
//  Copyright © 2019 Kedar Sukerkar. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

protocol KPageViewControllerDelegate: AnyObject {
    func pageDidSwipe(to index: Int)
}

class KPageViewController: UIPageViewController {
    
    
    // MARK: - Properties
    weak var swipeDelegate: KPageViewControllerDelegate?
    
    var pages = [UIViewController]()
    
    /// Indicates index position of current displayed controller
    public var currentPage: Int = 0
    
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
    
        
        // For disabling bouncing effect
        for subview in self.view.subviews {
            if let scrollView = subview as? UIScrollView {
                scrollView.delegate = self
                break
            }
        }
    }
    
    /// For selecting page of pageViewController
    func selectPage(at index: Int) {
        self.setViewControllers(
            [self.pages[index]],
            direction: self.direction(for: index),
            animated: true,
            completion: nil
        )
        self.currentPage = index
        
        self.view.layoutIfNeeded()
    }
    
    
    /// For getting direction of transition
    private func direction(for index: Int) -> UIPageViewController.NavigationDirection {
        return index > self.currentPage ? .forward : .reverse
    }
    
}

extension KPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return nil }
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
    
}

extension KPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let currentPageIndex = self.viewControllers?.first?.view.tag else { return }
            self.currentPage = currentPageIndex
            self.swipeDelegate?.pageDidSwipe(to: currentPageIndex)
        }
    }
    
}

extension KPageViewController: UIScrollViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (self.currentPage == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width) {
//            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0);
//        } else if (self.currentPage == self.pages.count - 1 && scrollView.contentOffset.x > scrollView.bounds.size.width) {
//            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0);
//        }
//    }
//
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        if (self.currentPage == 0 && scrollView.contentOffset.x <= scrollView.bounds.size.width) {
//            targetContentOffset.pointee = CGPoint(x: scrollView.bounds.size.width, y: 0);
//        } else if (self.currentPage == self.pages.count - 1 && scrollView.contentOffset.x >= scrollView.bounds.size.width) {
//            targetContentOffset.pointee = CGPoint(x: scrollView.bounds.size.width, y: 0);
//        }
//    }
    
    
}

