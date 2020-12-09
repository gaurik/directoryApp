//
//  BaseViewController.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 06/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //This is the default branding color for the app
    static let brandingColor = UIColor(named: "brandingColor")
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        configureTabBar()
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: UI configuration
    private func configureTabBar() {
        tabBarController?.tabBar.accessibilityIdentifier = "directoryTabBar"
        tabBarController?.accessibilityHint = "Select one tab"
        tabBarController?.tabBar.tintColor = UIColor.white
        tabBarController?.tabBar.barTintColor = BaseViewController.brandingColor
    }
    
    private func configureNavigationBar() {
        
        self.navigationItem.title = NSLocalizedString("VirginMoney", comment:"Virgin Money Directory")
        navigationController?.accessibilityLabel = self.navigationItem.title
        navigationController?.navigationBar.accessibilityIdentifier = "directoryNavigationBar"
        navigationController?.navigationBar.barTintColor = BaseViewController.brandingColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
