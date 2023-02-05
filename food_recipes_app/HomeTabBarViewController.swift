//
//  HomeTabBarViewController.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/30/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
       
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupVCs(){
                    let vc1 = UINavigationController(rootViewController: HomeViewController())
                    let vc2 = UINavigationController(rootViewController: FavoriteViewController())
                    let vc3 = UINavigationController(rootViewController: ProfileViewController())


                    vc1.tabBarItem.image = UIImage(systemName: "house")
                    vc2.tabBarItem.image = UIImage(systemName: "heart")
                    vc3.tabBarItem.image = UIImage(systemName: "person")


                    vc1.title = "Home"
                    vc2.title = "Favorite"
                    vc3.title = "Profile"
                    

                    setViewControllers([vc1, vc2, vc3], animated: true)
            
    
        }
    

   
}
