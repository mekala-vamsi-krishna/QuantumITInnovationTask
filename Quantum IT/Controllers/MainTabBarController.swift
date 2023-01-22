//
//  MainTabBarController.swift
//  Quantum IT
//
//  Created by Mekala Vamsi Krishna on 22/01/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 4
        
        navigationController?.navigationBar.isHidden = true
    }
    
}
