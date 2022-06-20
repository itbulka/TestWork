//
//  TabViewController.swift
//  TestWork
//
//  Created by Владимир Повальский on 15.06.2022.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.tabBar.tintColor = .systemGreen
        self.tabBar.backgroundColor = .white
        
        let vc1 = UINavigationController(rootViewController: PlacesViewController())
        let vc2 = UINavigationController(rootViewController: MapViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.title = "Заведения"
        vc2.tabBarItem.image = UIImage(systemName: "map")
        vc2.title = "Карта"
        
        setViewControllers([vc1, vc2], animated: true)
        
    }
    

}
