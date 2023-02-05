//
//  SceneDelegate.swift
//  food_recipes_app
//
//  Created by VPJ Production on 1/24/23.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let scene = scene as? UIWindowScene else {return}
        let mywindow = UIWindow(windowScene: scene)
        let nav = UINavigationController(rootViewController: HomeTabBarViewController())
        mywindow.rootViewController = nav
        self.window = mywindow
        mywindow.makeKeyAndVisible()
        
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

