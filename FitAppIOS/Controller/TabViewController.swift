//
//  ViewController.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 27/10/21.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 15.0, *) {
           let appearance = UITabBarAppearance()
           appearance.configureWithOpaqueBackground()
           appearance.backgroundColor = .systemBackground
           self.tabBar.standardAppearance = appearance
           self.tabBar.scrollEdgeAppearance = appearance
        }
        
        let goalViewController = GoalViewController()
        goalViewController.title = ""
        goalViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "flag"), selectedImage: UIImage(systemName: "flag.fill"))
        
        let historyViewController = HistoryViewController()
        historyViewController.title = ""
        historyViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "clock"), selectedImage: UIImage(systemName: "clock.fill"))
        
        let calculatorViewController = CalculatorViewController()
        calculatorViewController.title = ""
        calculatorViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        let goalNavigationController = UINavigationController(rootViewController: goalViewController)
        let historyNavigationController = UINavigationController(rootViewController: historyViewController)
        
        self.viewControllers = [historyNavigationController, goalNavigationController, calculatorViewController]
        self.selectedIndex = 1
    }


}

