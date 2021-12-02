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
        let goalItem = UITabBarItem(title: "", image: UIImage(systemName: "flag"), selectedImage: UIImage(systemName: "flag.fill"))
        goalItem.accessibilityLabel = "Meta Atual"
        goalItem.accessibilityHint = "Leva para a meta atual"
        goalViewController.tabBarItem = goalItem
        
        let historyViewController = HistoryViewController()
        historyViewController.title = ""
        let historyItem = UITabBarItem(title: "", image: UIImage(systemName: "clock"), selectedImage: UIImage(systemName: "clock.fill"))
        historyItem.accessibilityLabel = "Histórico"
        historyItem.accessibilityHint = "Leva para o histórico de exercícios"
        historyViewController.tabBarItem = historyItem
        
        let calculatorViewController = CalculatorViewController()
        calculatorViewController.title = ""
        let calculatorItem = UITabBarItem(title: "", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        calculatorItem.accessibilityLabel = "Calculadora"
        calculatorItem.accessibilityHint = "Leva para calculadora de IMC"
        calculatorViewController.tabBarItem = calculatorItem
        
        let goalNavigationController = UINavigationController(rootViewController: goalViewController)
        goalNavigationController.navigationBar.tintColor = UIColor(red: 0, green: 86/255, blue: 179/255, alpha: 1.0)
        let historyNavigationController = UINavigationController(rootViewController: historyViewController)
        historyNavigationController.navigationBar.tintColor = UIColor(red: 0, green: 86/255, blue: 179/255, alpha: 1.0)
        
        self.tabBar.tintColor = UIColor(red: 0, green: 86/255, blue: 179/255, alpha: 1.0)
        self.viewControllers = [historyNavigationController, goalNavigationController, calculatorViewController]
        self.selectedIndex = 1
    }


}

